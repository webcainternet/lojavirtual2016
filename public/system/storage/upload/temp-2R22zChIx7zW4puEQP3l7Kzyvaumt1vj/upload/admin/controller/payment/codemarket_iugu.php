<?php
class ControllerPaymentCodemarketIugu extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/codemarket_iugu');

		
        $this->document->setTitle($this->language->get('heading_title_main'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('codemarket_iugu', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
           $this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));			
        }
        
        $data['heading_title'] = $this->language->get('heading_title_modulo');
        $data['text_feito'] = $this->language->get('text_feito');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_all_zones'] = $this->language->get('text_all_zones');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        
        $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_save'] = $this->language->get('entry_save');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('payment/codemarket_iugu', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('payment/codemarket_iugu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}
       
        $data['action'] = $this->url->link('payment/codemarket_iugu', 'token=' . $this->session->data['token'], 'SSL');	
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
        
		if (isset($this->request->post['codemarket_iugu_geo_zone_id'])) {
		  $data['codemarket_iugu_geo_zone_id'] = $this->request->post['codemarket_iugu_geo_zone_id'];
		} else {
		  $data['codemarket_iugu_geo_zone_id'] = $this->config->get('codemarket_iugu_geo_zone_id'); 
		} 
		
		$this->load->model('localisation/geo_zone');
		
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['codemarket_iugu_status'])) {
		  $data['codemarket_iugu_status'] = $this->request->post['codemarket_iugu_status'];
		} else {
		  $data['codemarket_iugu_status'] = $this->config->get('codemarket_iugu_status');
		}
		
		if (isset($this->request->post['codemarket_iugu_sort_order'])) {
		  $data['codemarket_iugu_sort_order'] = $this->request->post['codemarket_iugu_sort_order'];
		} else {
		  $data['codemarket_iugu_sort_order'] = $this->config->get('codemarket_iugu_sort_order');
		}
        
        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/codemarket_iugu.tpl', $data));
        
	}
    
    public function install(){
        $this->load->model('user/user_group');
        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'module/' . $this->request->get['extension']);
        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'module/' . $this->request->get['extension']);
        
        //Criando a coluna para o ID do Cliente da IUGU
        $query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "customer` LIKE 'iugu_customer_id'");
        if (!$query->num_rows) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "customer` ADD (`iugu_customer_id` varchar(32),`iugu_cartao_id` varchar(32))");
        }

        //Criando a coluna para o ID do Pedido da IUGU
        $query1 = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "order` LIKE 'iugu_order_id'");
        if (!$query1->num_rows) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "order` ADD (`iugu_order_id` varchar(32),`iugu_subscription_id` varchar(32))");
        }

        //Criando a coluna assinatura_iugu e assinatura_iugu_identificador em Produto
        $query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product` LIKE 'assinatura_iugu'");
        if (!$query->num_rows) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD (`assinatura_iugu` varchar(6),`assinatura_iugu_identificador` varchar(45))");
        }
                
    }
    
    public function unistall(){
        $this->load->model('user/user_group');
        $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'module/' . $this->request->get['extension']);
        $this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'module/' . $this->request->get['extension']);
    }
    
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/codemarket_iugu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
