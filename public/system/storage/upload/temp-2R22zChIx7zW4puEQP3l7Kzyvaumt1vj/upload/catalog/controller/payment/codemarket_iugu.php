<?php
require_once(DIR_SYSTEM . 'library/iugu/Iugu.php');
//require_once(DIR_SYSTEM . 'library/codemarketFirephp.php');

class ControllerPaymentCodemarketIugu extends Controller {
    
    public function confirm() {
        $this->load->model('module/codemarket_module');
        $conf = $this->model_module_codemarket_module->getModulo('259');
        //Para ativar o Firephp use true ou false
        if((!empty($conf->iugu_firephp)) and ($conf->iugu_firephp == 1)){
            $ativar_firephp = true;
        }else {
            $ativar_firephp = false;
        }
        
        //$fire = CodemarketFirephp::log('iugu Transparente - confirm() ', $ativar_firephp);
        //$fire->log($conf,'Configuração iugu Transparente');
        //$this->fire->log('Dentro do Confirmar iugu Transparente');
        //5 = Falha no Pagamento
        //6 = CPF inválido ou vazio
        require_once(DIR_SYSTEM . 'library/validaCPF.php');
        $cpf_valida = new CPF();
        $this->log->write('Pagamento Transparente IUGU - Dentro do confirm()');
        $this->load->model('checkout/order');
        $this->load->model('account/customer');
        $this->load->model('payment/codemarket_iugu');
        $this->language->load('payment/codemarket_iugu');
        
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        $cliente = $this->model_account_customer->getCustomer($order_info['customer_id']);
        $produtos = $this->cart->getProducts();
        
        //$fire->log($order_info,'Order Info');
        //$fire->log($cliente,'Cliente');
        //$fire->log($produtos,'Produtos');

        if (!empty($this->request->post)) {
            $cartao = $this->request->post;
            $this->log->write('Pagamento Transparente IUGU - Pagamento por Cartão, salvado os Dados do Post - Pagamento Transparente IUGU.<br> Dados ' . implode(",", $cartao));
        }
        
        if(!empty($conf->iugu_cpf)) {
            $cpf_id = $conf->iugu_cpf;
        }else{
            $cpf_id = 1;
        }
        
        if(!empty($order_info['custom_field'][$cpf_id])) {
            $cpf = preg_replace("/[^0-9]/", '', $order_info['custom_field'][$cpf_id]);
        }
        
        if(!empty($cartao['cpf_iugu'])) {
            $cpf = preg_replace("/[^0-9]/", '', $cartao['cpf_iugu']);
        }
        
        if ((!empty($cartao)) and ((empty($cpf)) || (!$cpf_valida->validar($cpf)))) {
            $this->log->write('CPF inválido');
            echo 6;
        } else {
            //Token de Segurança
            Iugu::setApiKey($conf->iugu_token);

            //DADOS
            $name = trim($order_info['payment_firstname']) . ' ' . trim($order_info['payment_lastname']);
            $email = trim($order_info['email']);
            $telefone = preg_replace("/[^0-9]/", '', $order_info['telephone']);
            $telefone = ltrim($telefone, '0');
            $dd = mb_substr($telefone, 0, 2);
            $telefone = mb_substr($telefone, 2);
            $endereco = explode(",", trim($order_info['payment_address_1']));
            if (!empty($endereco[1])) {
               $numero = $endereco[1];
            } else {
                $numero = '1';
            }
            $rua = $endereco[0];

            //Produtos
            foreach ($produtos as $product) {
                $options_names = '';
                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
						
						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}
                    $options_names .= ' - ' . $option['name'] . ': ' . $value;
                }
                //Até 80 caracteres para a descrição do Produto
                $description = mb_substr($product['name'] . $options_names, 0, 80, 'UTF-8');
                if (($this->currency->format($product['price'], $order_info['currency_code'], false, false) * 100) >= 1) {
                    $item[] = array(
                        'description' => $description,
                        'quantity' => $product['quantity'],
                        'price_cents' => $this->currency->format($product['price'], $order_info['currency_code'], false, false) * 100
                    );
                }
            }

            $desconto = 0;

            $taxa_extra = $this->currency->format($order_info['total'] - $this->cart->getSubTotal(), $order_info['currency_code'], false, false) * 100;
            if ($taxa_extra >= 1) {
                $item[] = array(
                    'description' => $this->language->get('text_extra_amount'),
                    'quantity' => 1,
                    'price_cents' => $taxa_extra
                );
            } else {
                $desconto = abs($taxa_extra);
            }
            
            //$fire->log($item,'Lista de Produtos Finais');
            $this->log->write('Pagamento Transparente IUGU - Dados adicionados');

            //PASSO 1
            //Criando Cliente
            if (empty($cliente['iugu_customer_id'])) {
                //$fire->log('Criando cliente');
                $this->log->write('Pagamento Transparente IUGU - Criando cliente');
                $cliente = Iugu_Customer::create(Array(
                            "email" => $email,
                            "name" => $name
                ));

                if (!empty($cliente['id'])) {
                    $this->log->write('Pagamento Transparente IUGU - Adicionando referência do cliente ao Banco. ID = ' . $cliente['id']);
                    $this->db->query("UPDATE `" . DB_PREFIX . "customer`
                    SET iugu_customer_id= '" . $cliente['id'] . "'
                    WHERE customer_id = '" . $order_info['customer_id'] . "' ");
                    $this->log->write('Pagamento Transparente IUGU - Adicionado iugu_customer_id');
                }
                //$fire->log('Cliente criado, ID '.$cliente['id']);
            } else {
                //$fire->log('Cliente já existe, ID '.$cliente['iugu_customer_id']);
                $cliente['id'] = $cliente['iugu_customer_id'];
            }

            //Passo 2
            //Chamando a forma de Pagamento
            if (!empty($cartao)) {
                //$fire->log('Pagamento por Cartão de Crédito');
                if (empty($cartao['cartao_parcelas'])) {
                    $cartao['cartao_parcelas'] = 1;
                }
                $this->log->write('Pagamento Transparente IUGU - Pagamento por Cartão Inicio. Dados = ' . implode(",", $cartao));
                //Salvando o Cartão
                if ((!empty($cartao['salvar_cartao'])) and ( !empty($cartao['novo_cartao'])) and ( !empty($cartao['token']))) {
                    //$fire->log('Criando o Cartão na iugu');
                    $this->log->write('Pagamento Transparente IUGU - Criando o Cartão');
                    if ((!empty($cliente['id']))) {
                        $this->log->write('Pagamento Transparente IUGU - Criando Cartão IUGU');
                        $cp = Iugu_Customer::fetch($cliente['id'])->payment_methods()->create(Array(
                            "description" => "Cartão Principal",
                            "set_as_default" => true,
                            "token" => $cartao['token']
                        ));
                        $this->log->write('Pagamento Transparente IUGU - Cartão Criado IUGU');
                        if (!empty($cp['id'])) {
                            $this->log->write('Pagamento Transparente IUGU - Salvando na tabela do Cliente o id do Cartao');
                            $this->db->query("UPDATE `" . DB_PREFIX . "customer`
                            SET iugu_cartao_id = '" . $cp['id'] . "'
                            WHERE customer_id = '" . $order_info['customer_id'] . "' ");
                            $this->log->write('Pagamento Transparente IUGU - Cartão salvo no Banco de Dados');
                        }
                        //$fire->log($cp, 'Cartão criado com sucesso');
                    }
                }
                if (!empty($cp['id'])) {
                    $cartao['id'] = $cp['id'];
                }

                $this->log->write('Pagamento Transparente IUGU - Iniciando Pagamento por Cartão de Crédito');
                if (((!empty($cartao['id'])) and ( !empty($cartao['salvar_cartao']))) or ( (!empty($cartao['id'])) and ( !empty($cartao['usar_cartao_salvo'])))) {
                    //$fire->log('Iniciando pagamento por Cartão salvo');
                    $this->log->write('Pagamento Transparente IUGU - Pagamento por Cartão de Crédito - Usando Pagamento Salvo');
                    $p = Iugu_Charge::create(Array(
                                "customer_payment_method_id" => $cartao['id'],
                                "email" => $email,
                                "customer_id" => $cliente['id'],
                                "discount_cents" => $desconto,
                                "months" => $cartao['cartao_parcelas'],
                                "items" => $item,
                                "payer" => Array(
                                    "cpf_cnpj" => $cpf,
                                    "name" => $email,
                                    "phone_prefix" => $dd,
                                    "phone" => $telefone,
                                    "email" => $email,
                                    "address" => Array(
                                        "street" => $rua,
                                        "number" => $numero,
                                        "city" => $order_info['payment_city'],
                                        "state" => $order_info['payment_zone_code'],
                                        "country" => $order_info['payment_country'],
                                        "zip_code" => $order_info['payment_postcode']
                                    )
                                )
                    ));
                    //$fire->log($p, 'Pagamento por Cartão salvo, finalizado');
                } elseif (!empty($cartao['token'])) {
                    //$fire->log('Iniciando pagamento por Cartão sem salvar');
                    $this->log->write('Pagamento Transparente IUGU - Pagamento por Cartão de Crédito - Pagamento sem salvar o Cartão');
                    $p = Iugu_Charge::create(Array(
                                "token" => $cartao['token'],
                                "email" => $email,
                                "customer_id" => $cliente['id'],
                                "discount_cents" => $desconto,
                                "months" => $cartao['cartao_parcelas'],
                                "items" => $item,
                                "payer" => Array(
                                    "cpf_cnpj" => $cpf,
                                    "name" => $email,
                                    "phone_prefix" => $dd,
                                    "phone" => $telefone,
                                    "email" => $email,
                                    "address" => Array(
                                        "street" => $rua,
                                        "number" => $numero,
                                        "city" => $order_info['payment_city'],
                                        "state" => $order_info['payment_zone_code'],
                                        "country" => $order_info['payment_country'],
                                        "zip_code" => $order_info['payment_postcode']
                                    )
                                )
                    ));
                    //$fire->log($p, 'Pagamento por Cartão sem salvar, finalizado');
                }

                if ((!empty($p['success'])) and ( !empty($p['invoice_id']))) {
                    //$fire->log('Pagamento por Cartão de Créditito, realizado com sucesso');
                    $this->log->write('Pagamento Transparente IUGU - Pagamento por Cartão de Crédito Confirmado');
                    $duas_etapas =  $conf->iugu_duasetapas;
                    if((!empty($duas_etapas)) and ($duas_etapas == 1)) {
                        $status_confirmar = $conf->iugu_order_analise;
                        $duas_etapas = true;
                    }else {
                        $status_confirmar = $conf->iugu_order_paga;
                        $duas_etapas = false;
                    }
                    
                    $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $status_confirmar, 'Pagamento por Cartão de Crédito em '. $cartao['cartao_parcelas'].' X', true);

                    $this->db->query("UPDATE `" . DB_PREFIX . "order` SET iugu_order_id = '" . $p['invoice_id'] . "' WHERE order_id = '" . (int) $this->session->data['order_id'] . "'");
                    $this->log->write('Pagamento Transparente IUGU - Pagamento por Cartão de Crédito - Pedido Criado e Salvo o ID do Banco de Dados');
                    $this->session->data['cartao_iugu'] = array('cartao' => true, 'duas_etapas' => $duas_etapas);
                    //$fire->log('Pagamento concluído, retornando para a página de sucesso');
                    
                    if($ativar_firephp){
                        echo 5; exit();
                    }
                    
                    echo $this->url->link('checkout/success');
                } else {
                    //$fire->log($p, 'Pagamento por Cartão de Crédito, falhou');
                    $this->log->write('Pagamento Transparente IUGU - Pagamento por Cartão de Crédito Falhou. Erros '.print_r($p, true));
                    echo 5;
                }
            } else {
                //$fire->log('Iniciando pagamento por Boleto');
                $this->log->write('Pagamento Transparente IUGU - Pagamento por Boleto');
                $desconto_boleto = $conf->iugu_desconto_boleto;
                if(!empty($desconto_boleto)){
                    $desconto_boleto = ($this->currency->format($order_info['total']*($desconto_boleto/100), $order_info['currency_code'], false, false))*100;
                    $desconto = $desconto+$desconto_boleto;
                }

                if((!empty($conf->iugu_boleto_cobranca)) and ($conf->iugu_boleto_cobranca == 1)) {
                    $cobranca = 'false';
                }else {
                    $cobranca= 'true';
                }
                
                $p = Iugu_Invoice::create(Array(
                           "email" => $email,
                           "payable_with" => 'bank_slip',
                           "due_date" => date('Y-m-d', strtotime("+".$conf->iugu_boleto_vencimento." days")),
                            "ignore_due_email" => $cobranca,
                            "return_url" =>  $this->url->link('checkout/success', '', 'SSL'),
                            "expired_url" =>  $this->url->link('common/home', '', 'SSL'),
                            "discount_cents" => $desconto,
                            "items" => $item,
                            "customer_id" => $cliente['id'],
                            "payer" => Array(
                                "name" => $email,
                                "phone_prefix" => $dd,
                                "phone" => $telefone,
                                "email" => $email,
                                "address" => Array(
                                    "street" => $rua,
                                    "number" => $numero,
                                    "city" => $order_info['payment_city'],
                                    "state" => $order_info['payment_zone_code'],
                                    "country" => $order_info['payment_country'],
                                    "zip_code" => $order_info['payment_postcode']
                                )
                            )
                ));
                
                //$fire->log($p, 'Pagamento por Boleto finalizado');

                if ((!empty($p['id'])) and ( !empty($p['secure_url']))) {
                    //$fire->log('Pagamento por Boleto, confirmado com sucesso');
                    $this->log->write('Pagamento Transparente IUGU - Pagamento por Boleto Confirmado');
                    $url = $p['secure_url'].'?bs=true';
                    $h =  HTTPS_SERVER.'image/iugu/abrir-boleto.png';
        
                    $boleto = "
                        Pagamento por Boleto
                        Se não tiver pago, pague o Boleto para confirmar o Pagamento<br>
                        <a href='$url' rel='nofollow' target='_blank'><img src='$h'></a>
                    ";                        
                    
                    $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $conf->iugu_order_aguardando_pagamento, $boleto, true);
                    
                    $this->db->query("UPDATE `" . DB_PREFIX . "order` SET iugu_order_id = '" . $p['id'] . "' WHERE order_id = '" . (int) $this->session->data['order_id'] . "'");
                    $this->log->write('Pagamento Transparente IUGU - Retornando URL do Boleto e Pedido Salvo no Banco de Dados');
                    
                    $code_boleto = array(
                    'link' => "<a href='$url' rel='nofollow' target='_blank'><img src='image/iugu/imprimir-boleto.png'></a>",
                    'total' => 'R$ '.number_format($this->currency->format($order_info['total'], $order_info['currency_code'], false, false), 2, ',', ''),
                    'barcodel' =>$p['bank_slip']->digitable_line,
                    'barcode' => $p['bank_slip']->barcode
                    );
                    
                    $this->session->data['code_boleto'] = $code_boleto;
                    //$fire->log('Pagamento concluído, retornando para a página de sucesso');
                    
                    if($ativar_firephp){
                        echo 5; exit();
                    }
                    
                    echo $this->url->link('checkout/success');
                } else {
                    //$fire->log($p, 'Pagamento por Boleto, falhou');
                    $this->log->write('Pagamento Transparente IUGU - Pagamento por Boleto Falhou. Erros '.print_r($p, true));
                    echo 5;
                }
            }
        }
    }

    public function index() {
        $this->language->load('payment/codemarket_iugu');
        $this->load->model('module/codemarket_module');
        $conf = $this->model_module_codemarket_module->getModulo('259');
        $data['conf'] = $conf;
        $data['button_confirm'] = $this->language->get('button_confirm');
        $data['button_confirm_boleto'] = $this->language->get('button_confirm_boleto');
        $data['text_wait'] = $this->language->get('text_wait');
        $data['text_cartao'] = $this->language->get('text_cartao');
        $data['text_boleto'] = $this->language->get('text_boleto');
        $data['text_salvar_dados'] = $this->language->get('text_salvar_dados');
        $data['text_novo_cartao'] = $this->language->get('text_novo_cartao');
        $data['text_erro_pagamento'] = $this->language->get('text_erro_pagamento');
        $data['text_cvv'] = $this->language->get('text_cvv');
        $data['text_cartao_invalido'] = $this->language->get('text_cartao_invalido');
        $data['text_utilizar_cartao'] = $this->language->get('text_utilizar_cartao');

        $this->load->model('checkout/order');
        $this->load->model('account/customer');
        $this->load->model('payment/codemarket_iugu');

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        $cliente = $this->model_account_customer->getCustomer($order_info['customer_id']);

        //Listar Cartão
        Iugu::setApiKey($conf->iugu_token);
        $data['salvar_cartao'] = $conf->iugu_salvar_cartao;
        if (($conf->iugu_cartao == 1) and ( !empty($cliente['iugu_customer_id'])) and ( !empty($cliente['iugu_cartao_id'])) and ( !empty($data['salvar_cartao']))) {
            $cartao_salvo = Iugu_PaymentMethod::fetch(Array(
                        "customer_id" => $cliente['iugu_customer_id'],
                        "id" => $cliente['iugu_cartao_id'],
            ));
            if (!empty($cartao_salvo)) {
                $data['cartao_salvo'] = $cartao_salvo;
            }
        }

        $data['total'] = number_format($order_info['total'], 2, '.', '');
        //Desconto Boleto
        $desconto_boleto = $conf->iugu_desconto_boleto;
        if(!empty($desconto_boleto)){
            $data['desconto_boleto'] = $this->currency->format($data['total']*($desconto_boleto/100), $order_info['currency_code'], false, false);
            $data['desconto_boleto_total'] = $data['total']-$data['desconto_boleto'];

            $desconto_boleto = (($this->currency->format($order_info['total'], $order_info['currency_code'], false, false))*($desconto_boleto/100)) * 100;


            $data['desconto_boleto']  = number_format($data['desconto_boleto'], 2, ',', '');
            $data['desconto_boleto_subtotal']  = number_format($data['total'], 2, ',', '');
            $data['desconto_boleto_total']  = number_format($data['desconto_boleto_total'], 2, ',', '');
        }

        if (($conf->iugu_cartao == 1) and ( $conf->iugu_parcelamento == 1) and ( $conf->iugu_taxa_cartao > 0) and ( $conf->iugu_total_parcelas > 0) and ( $conf->iugu_sem_juros > 0)) {
            $cartao = "<select class='form-control parcela' name='cartao_parcelas'>";
            $parcela = array(2 => 3, 3 => 4, 4 => 5, 5 => 6, 6 => 8, 7 => 9, 8 => 10, 9 => 11, 10 => 13, 11 => 14, 12 => 15);
            $cartao .= "<option class='green' selected='' value='1'>1 x R$ " . $data['total'] . " sem juros</option>";
            $taxa = 100 - $conf->iugu_taxa_cartao;
            $sem_juros = $conf->iugu_sem_juros;

            for ($i = 2; $i <= $conf->iugu_total_parcelas; $i++) {
                if ($sem_juros >= $i) {
                    $parcelas = number_format(($data['total'] / $i), 2, ',', '');
                    $cartao .="<option class='green' value='$i'>" . $i . " X R$ " . $parcelas . " sem juros</option>";
                } else {
                    $taxa2 = 100 - ($conf->iugu_taxa_cartao + $parcela[$i]);
                    $conta = (round((($taxa / $taxa2) * $data['total']), 2));
                    $parcelas = number_format(($conta / $i), 2, ',', '');
                    $cartao .= "<option value='$i'>" . $i . " X R$ " . $parcelas . "</option>";
                }
            }
            $cartao .= "</select>";
            $data['cartao'] = $cartao;
        } else {
            $data['cartao'] = false;
        }
        
        if(!empty($conf->iugu_cpf)) {
            $cpf_id = $conf->iugu_cpf;
        }else{
             $cpf_id = 1;
        }
        
        if(!empty($order_info['custom_field'][$cpf_id])) {
           $data['cpf'] = $order_info['custom_field'][$cpf_id];
        }
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/codemarket_iugu.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/payment/codemarket_iugu.tpl', $data);
        } else {
            return $this->load->view('default/template/payment/codemarket_iugu.tpl', $data);
        }
    }

//Mudando o Histórico do Pedido
    public function callback() {
        if (($this->request->server['REQUEST_METHOD'] == 'POST') and ( !empty($_POST["data"]))) {
            $dados = $_POST["data"];
            $this->log->write('Pagamento Transparente IUGU - Entrou no callback(). <br>ID do Pedido ' . $dados['id'] . ' Status ' . $dados['status']);
            $this->load->model('payment/codemarket_iugu');
//Buscando o Pedido com base no ID do Pedido da IUGU
            $query = $this->db->query("SELECT order_id FROM  `" . DB_PREFIX . "order`  WHERE iugu_order_id = '" . (int)$dados['id'] . "'");
            
            if(!empty($query->row)) {
                $order_id = $query->row['order_id'];
                $this->load->model('checkout/order');
                $order = $this->model_checkout_order->getOrder($order_id);
            }
            
            if (!empty($order)) {
                $this->load->model('module/codemarket_module');
                $conf = $this->model_module_codemarket_module->getModulo('259');
                
                $this->log->write('Pedido retornado com sucesso - Status ID ' . $order['order_status_id']);
                $update_status_alert = false;
                if ($conf->iugu_update_status_alert) {
                    $update_status_alert = true;
                }
//Mudando o Histórico do Pedido com base no Status retornado pela IUGU
                switch ($dados['status']) {
                      case 'paid':
                        $order_status_id =  $conf->iugu_order_paga;
                        $order_id = $order['order_id'];
                        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "' AND order_status_id = '" . (int)$order_status_id . "'");
                        if(empty($query->row)) {
                            $this->model_checkout_order->addOrderHistory($order_id, $conf->iugu_order_paga, '', $update_status_alert);
                            $this->log->write('Histórico do Pedido mudado - paid');
                        }
                        break;
                    case 'canceled':
                        $order_status_id =  $conf->iugu_order_cancelada;
                        $order_id = $order['order_id'];
                        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "' AND order_status_id = '" . (int)$order_status_id . "'");
                        if(empty($query->row)) {
                            $this->model_checkout_order->addOrderHistory($order_id, $conf->iugu_order_cancelada, '', $update_status_alert);
                            $this->log->write('Histórico do Pedido mudado - canceled');
                        }
                        break;
                    case 'payment_in_progress':
                        $order_status_id =  $conf->iugu_order_analise;
                        $order_id = $order['order_id'];
                        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "' AND order_status_id = '" . (int)$order_status_id . "'");
                        if(empty($query->row)) {
                            $this->model_checkout_order->addOrderHistory($order_id, $conf->iugu_order_analise, '', $update_status_alert);
                            $this->log->write('Histórico do Pedido mudado - payment_in_progress');
                        }
                        break;
                    case 'expired':
                        $order_status_id = $conf->iugu_order_expirado;
                        $order_id = $order['order_id'];
                        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "' AND order_status_id = '" . (int)$order_status_id . "'");
                        if(empty($query->row)) {
                            $this->model_checkout_order->addOrderHistory($order_id, $conf->iugu_order_expirado, '', $update_status_alert);
                            $this->log->write('Histórico do Pedido mudado - expired');
                        }
                        break;
                    case 'refunded':
                        $order_status_id =  $conf->iugu_order_reembolsado;
                        $order_id = $order['order_id'];
                        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "' AND order_status_id = '" . (int)$order_status_id . "'");
                        if(empty($query->row)) {
                            $this->model_checkout_order->addOrderHistory($order_id, $conf->iugu_order_reembolsado, '', $update_status_alert);
                            $this->log->write('Histórico do Pedido mudado - refunded');
                        }
                        break;
                }
            }
        }
    }
}