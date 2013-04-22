
</div>
</div>
 <?php
$displayCustomFooter=$this->config->get('customFooter_status');
$information_column_status=$this->config->get ( 'information_column_status' );
$service_column_status=$this->config->get ( 'service_column_status' );
$extras_column_status=$this->config->get ( 'extras_column_status' );
$account_column_status=$this->config->get ( 'account_column_status' );
$payment_column_status=$this->config->get ( 'payment_column_status' );
$followus_column_status=$this->config->get ( 'followus_column_status' );
$followus_images=$this->config->get ( 'followus_images' );
$payment_images=$this->config->get ( 'payment_images' );
$custom_footer_column_status=$this->config->get ( 'custom_footer_column_status' );
$custom_footer_column_header=$this->config->get ( 'custom_footer_column_header' );
$custom_footer_column_content=$this->config->get ( 'custom_footer_column_content' );
if($displayCustomFooter == '1') {

}
?>
  <div id="fc_footer">
  <div id="footer">  
  <?php
	if ($custom_footer_column_status == '1') {
		?>
		  <div id="custom_column_footer">
		<h3><?php echo $custom_footer_column_header; ?></h3>
	<?php echo html_entity_decode($custom_footer_column_content); ?> <br/>
	 

</div>

		<?php } ?>
  
     <?php if ( $information_column_status=='1') { ?>
    <div class="column" style="">
      <h3><?php echo $text_information; ?></h3>
      <ul>
        <?php foreach ($informations as $information) { ?>
        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
        <?php } ?>
      </ul>
    </div>  <?php } if ( $service_column_status=='1') { ?>
   
    <div class="column">
      <h3><?php echo $text_service; ?></h3>
      <ul>
        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
      </ul>
    </div> <?php } if ( $extras_column_status=='1') { ?>
    <div class="column">
      <h3><?php echo $text_extra; ?></h3>
      <ul>
        <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
        <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
        <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
        <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
      </ul>
    </div><?php } if ( $account_column_status=='1') { ?>
    <div class="column">
      <h3><?php echo $text_account; ?></h3>
      <ul>
        <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>
    </div><?php } if ( $payment_column_status=='1') { ?>
     <div class="payment">
        <h3><?php echo $text_payment; ?></h3>
      <?php foreach ($paymentimages as $paymentimage) { ?>
  <?php if ($paymentimage['link']) { ?>
  <a href="<?php echo $paymentimage['link']; ?>"><img src="<?php echo $paymentimage['image']; ?>" alt="<?php echo $paymentimage['title']; ?>" title="<?php echo $paymentimage['title']; ?>" /></a>
  <?php } else { ?>
 <img src="<?php echo $paymentimage['image']; ?>" alt="<?php echo $paymentimage['title']; ?>" title="<?php echo $paymentimage['title']; ?>" />
  <?php } ?>
  <?php } ?>
    </div>  
    <?php } if ( $followus_column_status=='1') { ?>
     <div class="follow">
       <h3><?php echo $text_followus; ?></h3>
       <?php foreach ($followusimages as $followusimage) { ?>
  <?php if ($followusimage['link']) { ?>
  <a href="<?php echo $followusimage['link']; ?>"><img src="<?php echo $followusimage['image']; ?>" alt="<?php echo $followusimage['title']; ?>" title="<?php echo $followusimage['title']; ?>" /></a>
  <?php } else { ?>
 <img src="<?php echo $followusimage['image']; ?>" alt="<?php echo $followusimage['title']; ?>" title="<?php echo $paymentimage['title']; ?>" />
  <?php } ?>
  <?php } ?>
    </div> <?php } ?>
    	
		

<div id="powered"><?php echo $powered; ?></div>
  </div>
  
 
 
</div>
</body></html>