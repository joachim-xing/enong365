<?php
class ControllerModulePopupCategory extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/popupcategory');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('popupcategory', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token']);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_left'] = $this->language->get('text_left');
		$this->data['text_right'] = $this->language->get('text_right');
		
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_usecache'] = $this->language->get('entry_usecache');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');


 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['popupcategory_module'])) {
			$this->data['modules'] = $this->request->post['popupcategory_module'];
		} elseif ($this->config->get('popupcategory_module')) { 
			$this->data['modules'] = $this->config->get('popupcategory_module');
		}	
		
  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);
		
   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=module/popupcategory&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=module/popupcategory&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'];

		if (isset($this->request->post['popupcategory_position'])) {
			$this->data['popupcategory_position'] = $this->request->post['popupcategory_position'];
		} else {
			$this->data['popupcategory_position'] = $this->config->get('popupcategory_position');
		}
		
		if (isset($this->request->post['popupcategory_status'])) {
			$this->data['popupcategory_status'] = $this->request->post['popupcategory_status'];
		} else {
			$this->data['popupcategory_status'] = $this->config->get('popupcategory_status');
		}
		
		if (isset($this->request->post['popupcategory_sort_order'])) {
			$this->data['popupcategory_sort_order'] = $this->request->post['popupcategory_sort_order'];
		} else {
			$this->data['popupcategory_sort_order'] = $this->config->get('popupcategory_sort_order');
		}
		
		if (isset($this->request->post['popupcategory_usecache'])) {
			$this->data['popupcategory_usecache'] = $this->request->post['popupcategory_usecache'];
		} else {
			$this->data['popupcategory_usecache'] = $this->config->get('popupcategory_usecache');
		}
		
		$this->template = 'module/popupcategory.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/popupcategory')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>