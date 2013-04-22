<?php
class ControllerModuleFcCustomFooter extends Controller
{
    private $error = array();

    public function index()    {


        $this->load->language('module/fc_customfooter');

		$this->load->model('setting/setting');
		$this->load->model('design/banner');
		
		$this->data['banners'] = $this->model_design_banner->getBanners();
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {


            $this->model_setting_setting->editSetting('fc_customfooter', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');


            $this->redirect(HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->
                session->data['token']);
        }


        $text_strings = array('heading_title', 'text_enabled', 'text_disabled',
            'text_left', 'text_right', 'text_home', 'entry_position', 'entry_status',
            'entry_sort_order', 'button_save', 'button_cancel'
                        //this is an example extra field added
            );

        foreach ($text_strings as $text) {
            $this->data[$text] = $this->language->get($text);
        }

        //END LANGUAGE

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->document->breadcrumbs = array();

        $this->document->breadcrumbs[] = array('href' => HTTPS_SERVER .
            'index.php?route=common/home&token=' . $this->session->data['token'], 'text' =>
            $this->language->get('text_home'), 'separator' => false);

        $this->document->breadcrumbs[] = array('href' => HTTPS_SERVER .
            'index.php?route=extension/module&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_module'), 'separator' => ' :: ');

        $this->document->breadcrumbs[] = array('href' => HTTPS_SERVER .
            'index.php?route=module/fc_customfooter&token=' . $this->session->data['token'],
            'text' => $this->language->get('heading_title'), 'separator' => ' :: ');

        $this->data['action'] = HTTPS_SERVER . 'index.php?route=module/fc_customfooter&token=' .
            $this->session->data['token'];

        $this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' .
            $this->session->data['token'];

        $config_data = array(
        'custom_footer_column_status',
        'custom_footer_column_header',
        'custom_footer_column_content',
          'twitter_column_status',
          'twitter_column_header',
        'twitter_number_of_tweets',
        'twitter_username',
        'categories_column_status',
		'information_column_status',
		'service_column_status',
		'extras_column_status',
		'account_column_status',
		'payment_column_status',
		'payment_images',
		'followus_images',
		'followus_column_status',
		'paymentimages'		
        					);

        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $this->data[$conf] = $this->request->post[$conf];
            } else {
                $this->data[$conf] = $this->config->get($conf);
            }
        }

        $this->template = 'module/fc_customfooter.tpl';
        $this->children = array('common/header', 'common/footer');

        $this->response->setOutput($this->render(true), $this->config->get('config_compression'));
    }


    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'module/fc_customfooter')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

       

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
?>