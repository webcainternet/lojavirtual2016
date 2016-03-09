<?php
require_once(DIR_SYSTEM . 'library/codemarketVal.php');
//PROIBIDO MODIFICAR ESTE ARQUIVO
class ControllerExtensionCodemarketTicket extends Controller {
	public function index() {				
        $this->load->model('setting/setting');
        
        $data['codemarket_module'] = $this->url->link('extension/codemarket_module&token=' . $this->session->data['token'],'', 'SSL');

        $codemarket = new CodemarketVal();                    
        $conf = $this->model_setting_setting->getSetting('codemarket_val');
        if(!empty($conf)) {
            $email = $conf['codemarket_val_email'];
            $token = $conf['codemarket_val_token'];
            $data['dom'] = HTTP_CATALOG;
            $data['cliente'] = $token;
            $data['email'] = $email;
        }
        
        $data['ticketListar'] = 'https://www.codemarket.com.br/api/ticket/listar';

        $this->document->setTitle('Code Market - Tickets'); 

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/codemarket_ticket.tpl', $data));
	}
}