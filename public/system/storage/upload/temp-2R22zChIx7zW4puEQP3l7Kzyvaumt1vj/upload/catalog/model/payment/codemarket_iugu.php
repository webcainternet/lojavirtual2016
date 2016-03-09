<?php

class ModelPaymentCodemarketIugu extends Model {

    public function getMethod($address, $total) {
        $this->load->language('payment/codemarket_iugu');
        $this->load->model('module/codemarket_module');
        $conf = $this->model_module_codemarket_module->getModulo('259');
        
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('codemarket_iugu_geo_zone_id') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

        if (!$this->config->get('codemarket_iugu_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        $ativa = 0;
        if (($conf->iugu_boleto == 1) and ( ($conf->iugu_minimo_boleto > $total) or ( $conf->iugu_maximo_boleto < $total))) {
            $ativa++;
        }

        if (($conf->iugu_cartao == 1) and ( ($conf->iugu_minimo_cartao > $total) or ($conf->iugu_maximo_cartao < $total))) {
            $ativa++;
        }

        //Retorne false, ae ambos estão ativos e não passaram no teste acima
        //Caso ambos estejam ativos
        if (($conf->iugu_boleto == 1) and ($conf->iugu_cartao == 1)) {
            if ($ativa == 2)
                $status = false;
        }elseif (($conf->iugu_boleto == 1) or ( $conf->iugu_cartao == 1)) {
            if ($ativa > 0)
                $status = false;
        }else {
            $status = false;
        }

        $method_data = array();

        if ($status) {
            $method_data = array(
                'code' => 'codemarket_iugu',
                'title' => $this->language->get('text_title'),
                'terms' => '',
                'sort_order' =>$this->config->get('codemarket_iugu_sort_order')
            );
        }

        return $method_data;
    }

    public function getCustomer($customer_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int) $customer_id . "'");
        return $query->row;
    }
}
