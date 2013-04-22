<?php
echo $header;
?>
<div id="content">
<?php

if ($error_warning) {
	?>
<div class="warning"><?php
	echo $error_warning;
	?></div>
<?php
}
?>
<div class="box">

<div class="heading">
<h1><?php
echo $heading_title;
?></h1>
<div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php
echo $button_save;
?></span></a><a onclick="location = '<?php
echo $cancel;
?>';"
	class="button"><span><?php
	echo $button_cancel;
	?></span></a></div>
</div>

<form action="<?php
echo $action;
?>" method="post"
	enctype="multipart/form-data" id="form">
	</br>
<td>Custom Footer Module Status: </td>
		<select name="custom_footer_status">
              <?php
														if ($custom_footer_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select>
            </br></br>
<div id="tabs" class="htabs">
<a	href="#tab_custom">Custom</a><a
    href="#tab_information">Information</a><a
    href="#tab_service">Service</a><a
    href="#tab_extras">Extras</a><a
    href="#tab_account">My account</a><a
    href="#tab_payment">Payment</a><a
    href="#tab_followus">Follow Us</a></div>

<div id="tab_custom">
<table class="form">
	<tr>
		<td>Custom Footer Column Status</td>
		<td><select name="custom_footer_column_status">
              <?php
														if ($custom_footer_column_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	
	<tr>
		<td>Custom column header name: </td>
		<td><input type="text" name="custom_footer_column_header"
			value="<?php
			echo $custom_footer_column_header;
			?>"></td>
	</tr>
	
		<tr>
		<td>Content: </td>
		<td>
		<textarea name="custom_footer_column_content" rows="10" cols="40"><?php echo $custom_footer_column_content; ?></textarea>
		</td>
	</tr>
</table>
</div>


<div id="tab_information">
<table class="form">
	<tr>
		<td>Information Column Status</td>
		<td><select name="information_column_status">
              <?php
														if ($information_column_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
    </table>
 </div>
 
 <div id="tab_service">
<table class="form">
    <tr>
		<td>Customer Service Column Status</td>
		<td><select name="service_column_status">
              <?php
														if ($service_column_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
    </table>
</div>


<div id="tab_extras">
<table class="form">    
    <tr>
		<td>Extras Column Status</td>
		<td><select name="extras_column_status">
              <?php
														if ($extras_column_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
    </table>
</div>
    
    
    <div id="tab_account">
<table class="form">
        <tr>
		<td>My Account Column Status</td>
		<td><select name="account_column_status">
              <?php
														if ($account_column_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
    </table>
</div>
    
<div id="tab_payment">
        <table class="form">          
          <tr>
            <td> Payment status:</td>
            <td><select name="payment_column_status">
                <?php if ($payment_column_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
              
              <td class="left"><select name="payment_images">
                <?php foreach ($banners as $banner) { ?>
                <?php if ($banner['banner_id'] ==$payment_images) { ?>
                <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
        </table>
</div>
    
<div id="tab_followus">
<table class="form">          
          <tr>
            <td> Follow Us Status:</td>
            <td><select name="followus_column_status">
                <?php if ($followus_column_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
              
              <td class="left"><select name="followus_images">
                <?php foreach ($banners as $banner) { ?>
                <?php if ($banner['banner_id'] ==$followus_images) { ?>
                <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
              
             
          </tr>
        </table>
    </div>


</form>
</div>
</div>
</div>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<?php
echo $footer;
?>