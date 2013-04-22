<?php
class ControllerModuleFcCustomFooter extends Controller {
	protected function index() {
		//Load the language file for this module - catalog/language/module/my_module.php
		$this->language->load ( 'module/fc_customfooter' );
		
		//Get the title from the language file		
		
		$this->data['categories_text'] = $this->language->get('categories_text');

		$this->data ['custom_footer_status'] = $this->config->get ( 'custom_footer_status' );	
	
		// CUSTOM COLUMN
		$this->data ['custom_footer_column_status'] = $this->config->get ( 'custom_footer_column_status' );
		$this->data ['custom_footer_column_header'] = $this->config->get ( 'custom_footer_column_header' );
		$this->data ['custom_footer_column_content'] = $this->config->get ( 'custom_footer_column_content' );
		
		//INFORMATION
		$this->data ['information_column_status'] = $this->config->get ( 'information_column_status' );
		//SERVICE
		$this->data ['service_column_status'] = $this->config->get ( 'service_column_status' );
		
		//EXTRASS
		$this->data ['extras_column_status'] = $this->config->get ( 'extras_column_status' );
		
		//MY ACCOUNT
		$this->data ['account_column_status'] = $this->config->get ( 'account_column_status' );
		//PAYMENT		
		$this->data ['payment_column_status'] = $this->config->get ( 'payment_column_status' );
		$this->data['payment_images'] = $this->config->get('payment_images');
			
		$this->data['paymentimages'] = array();
		$this->load->model('design/banner');	
		$this->load->model('tool/image');	
		$results = $this->model_design_banner->getBanner($this->data['payment_images']);		  
		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['paymentimages'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], 50, 31)
				);
			}
		}
		
		//FOLLOW US		
		$this->data ['followus_column_status'] = $this->config->get ( 'followus_column_status' );
		$this->data['followus_images'] = $this->config->get('followus_images');
		
	

		$this->data ['custom_html'] = $this->config->get ( 'custom_html' );
		$this->id = 'fc_customfooter';


		if (file_exists ( DIR_TEMPLATE . $this->config->get ( 'config_template' ) . '/template/module/fc_customfooter.tpl' )) {
			$this->template = $this->config->get ( 'config_template' ) . '/template/module/fc_customfooter.tpl';
		} else {
			$this->template = 'default/template/module/fc_customfooter.tpl';
		}
		
		$this->render ();
	}
}
?>