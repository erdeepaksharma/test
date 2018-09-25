<?php echo $header; ?>
<style type="text/css">
.imageerror {
	display:none;
    float: left !important;
    width: 100% !important;
}
.imgoption {
	display: block;
	margin-top: 5px;
	width: 18%;
}
.imgoption button {
	width: 100%;
}

.AccountMS .alert-danger {
     width: 75%; 
}

label.fee.control-label {
    margin: -1px;
    padding: 0px;
}

label.home {
    margin-left: 16px;
	font-size:10px;
}

#modal-image .modal-body #button-refresh{display:none;}
#modal-image .modal-body #button-delete{display:none;}
#modal-image .modal-body #button-parent{display:none;}
#modal-image .modal-body #button-folder{display:none;}

#modal-image .modal-body .row .col-sm-3 label{display:block;}
#modal-image .modal-body .row .col-sm-7 .input-group{display:none;}
#modal-image .modal-body hr{visibility:hidden;}
#modal-image .modal-content .modal-footer{display:none;}

.yourlist {
    clear: both;
    float: left;
    line-height: 0;
    margin: 0 0 20px;
    padding: 14px 20px 5px;
    width: 100%;
}
.modal-open{ overflow-y:scroll !important;}
</style>

<?php if($chkIsPartner){ ?>

<div class="container AccountMS">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger MobAltBox"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
  <?php } ?>
  <!--<?php if($marketplace_product_reapprove) { ?>
  <div class="alert alert-info"> <i class="fa fa-info-circle"></i> <?php echo $marketplace_product_reapprove; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>-->
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"> </i> <?php echo $success; ?></div>
  <?php } ?>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
	
    <div id="content" class="<?php echo $class; ?> NewListbox"><?php echo $content_top; ?>
	 <?php echo $partner_header; ?>
	 <?php if(isset($pending)) { ?>
	 <div class="alert dismissable alert-success yourlist"> 
        <!--<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>-->
        <h4><font color="#4c4545">Your listing has been updated. Please click on Submit for Approval for us to review these changes.</font></h4>
		
</div>
	<?php }?>
 
	
      <div class="MProfileT"><h1><span><?php echo $heading_title; ?></span>
        <div class="pull-right"> 
		<?php if($product_info1['status'] == 1){ ?>
		<button type="button" class="AUpoBut" id="submit_approval">Submit for Approval</button>
		
		<?php } else {?>
		<button type="submit" class="AUpoBut" id="submit_approval">Submit for Approval</button>
		
        <!--<button data-toggle="tooltip" href="javascript:void(0);" class="AUpoBut" title="<?php echo $button_submit; ?>" id="submit_approval">Submit for Approval</button>-->				<button type="submit" class="AUpoBut save" id="save">Save</button>
		<?php } ?>
		<!--<a onclick="$('#form-save').submit();" data-toggle="tooltip" class="AUpoBut save" id="save">Save</a>--><a href="javascript:history.go(-1)" data-toggle="tooltip" class="ASkiBut">Back</a></div>
      </h1></div>
      <br />
      <?php if(!isset($access_error) && $isMember) { ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-save" class="form-horizontal" >
        <!-- membership codes starts here -->
        <?php if(isset($wk_seller_group_status) && $wk_seller_group_status) { ?>
        <input type="hidden" value="<?php if(isset($isClone) && $isClone) echo $isClone; ?>" name="clone">
        <input type="hidden" value="<?php if(isset($isRelist) && $isRelist) echo $isRelist; ?>" name="relist">
        <input type="hidden" value="<?php if(isset($isEdit) && $isEdit) echo $isEdit; ?>" name="edit">
       
        <?php } ?>
         <input type="hidden" class="class_submit_approval" value="" name="submit_approval">
         <input type="hidden" class="class_status" value="4" name="status">
        <!-- membership codes ends here -->
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          
          <!--
         <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
        <?php if(isset($mp_allowproducttabs['links'])){ ?>
          <li><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
        <?php } ?>

        <?php if(isset($mp_allowproducttabs['attribute'])){ ?>
         <li> <a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
        <?php } ?>

        <?php if(isset($mp_allowproducttabs['options'])){ ?>
          <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
        <?php } ?>

        <?php if(isset($mp_allowproducttabs['discount'])){ ?>
         <li> <a href="#tab-discount" data-toggle="tab"><?php echo $tab_discount; ?></a></li>
        <?php } ?>--> 
          
        <!--  <?php if(isset($mp_allowproducttabs['special'])){ ?>
          <li><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>
        <?php } ?>-->
          
          <li> <a href="#tab-image" data-toggle="tab" id="imagelink"><?php echo $tab_image; ?></a> </li>
          
          <!-- <li> <a href="#tab-video" data-toggle="tab"><?php echo $tab_video; ?></a>   </li>-->
          
          <?php if(isset($mp_allowproducttabs['custom-field'])) { ?>
          <!-- <li><a href="#tab-custom-field" data-toggle="tab"><?php echo $text_custom_field; ?></a></li>-->
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <div class="tab-content">
              <?php if($update_dive==1) { ?>
              <?php  $tabCount = 1; $wkcustom_option_row =1;
                  if(!empty($serviceCustomFields)) { 
                    foreach($serviceCustomFields as $tabs) { ?>
              <div id="wktab-option1-<?php echo $tabCount; ?>" class="tab-pane1"> 
                <!--<div class="alert alert-info">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldName']; ?>
                        </div>-->
                <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                <?php } ?>
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                <?php if($tabs['fieldType'] == 'select') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                      <?php
                                    }  ?>
                    </select>
                  </div>
                </div>
                <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                <div class="form-group NCheckBox <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="control-label col-sm-3">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9 sessiontype">
                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                    <div class="radio checkbox">
                      <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                        <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                        <?php echo $options['optionValue']; ?> </label>
                    </div>
                    <?php }  ?>
                  </div>
                </div>
                <?php }else if($tabs['fieldType'] == 'text') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>"/>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span data-toggle="tooltip" title="<?php echo $tabs['fieldDes']; ?>"></span></label>
                  <div class="col-sm-9">
                    <textarea class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group date">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group time">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">Select date-time <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group datetime">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  } ?>
              </div>
              <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              
              <!--for category-->
              <?php if(isset($mp_allowproducttabs['links'])){ ?>
              <input type="hidden" name="product_link_tab" value="1">
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-category"><?php echo $entry_category; ?><!--<span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $help_category; ?>" data-original-title="" title=""></span>--></label>
                <div class="col-sm-9 categoryerror">
                  <input type="text" name="category" value="" placeholder="Click here to add categories" id="input-category" class="form-control" />
                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_categories as $product_category) { ?>
                    <div id="product-category<?php echo $product_category['category_id']; ?>" ><i class="fa fa-minus-circle "></i><?php echo $product_category['name']; ?>
                      <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <?php } ?>
              
              <!--for service name-->
              <?php $count = 0; foreach ($languages as $language) { ?>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?><span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content='Choosing a good Service Name is important to your business because it will be one of the first things a customer sees and will remember about you. Your Service name will help identify and separate you from the other vendors so choose a name that will really help you stand out. Here’s a guide to help you find a great Service Name <br> <a href="https://support.zowedo.com/partner-training" target="_blank" style ="color:#ea9000;">https://support.zowedo.com/partner-training</a>' data-original-title="" title=""></span></label>
                <div class="col-sm-9 servicename">
                  <input maxlength="60" type="text" class="form-control" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label LisCLab" for="input-description<?php echo $language['language_id']; ?>">
                <?php echo $entry_description; ?><h5 class="CharLMsg">Character limit: 500</h5>
                </label>
				
                <div class="col-sm-9 service_description">
                  <textarea rows="7" maxlength="500" name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description1<?php echo $language['language_id']; ?>" class="form-control Hauto-Form"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                </div>
              </div>
              <div class="form-group required" style="display:none;">
                <label class="col-sm-3 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                <div class="col-sm-9">
                  <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]"  placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" />
                  <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              
              <!--for whats included or not included-->
              <?php  $tabCount = 2; $wkcustom_option_row = 2;
                  if(!empty($whatsincludeCustomFields)) { 
                    foreach($whatsincludeCustomFields as $tabs) { ?>
              <div id="wktab-option1-<?php echo $tabCount; ?>" class="tab-pane1"> 
                <!--<div class="alert alert-info">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldName']; ?>
                        </div>-->
                <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                <?php } ?>
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                <?php if($tabs['fieldType'] == 'select') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
				  
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                      <?php
                                    }  ?>
                    </select>
                  </div>
                </div>
                <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="control-label col-sm-3">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                    <div class="radio checkbox">
                      <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                        <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                        <?php echo $options['optionValue']; ?> </label>
                    </div>
                    <?php }  ?>
                  </div>
                </div>
                <?php }else if($tabs['fieldType'] == 'text') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <input class="form-control Hauto-Form" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label LisCLab">
                    <?php  echo $tabs['fieldName']; ?><font color="#FF0000">*</font>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span><h5 class="CharLMsg">Character limit: 500</h5></label>
                  <div class="col-sm-9 whats_included_<?php echo $wkcustom_option_row; ?>">
                    <textarea maxlength="500" class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" id="whats_included_<?php echo $wkcustom_option_row; ?>"placeholder="<?php  echo $tabs['fieldName']; ?>"><?php if(isset($tabs['fieldOptions']['option_id'])) echo trim($tabs['fieldOptions']['option_id']); ?></textarea>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group date">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group time">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">Select date-time <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group datetime">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  } ?>
              </div>
              <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              
              <!--for cancelation policy-->
              <?php  $tabCount = 4; $wkcustom_option_row = 4;
                  if(!empty($cancelCustomFields)) { 
                    foreach($cancelCustomFields as $tabs) { ?>
              <div id="wktab-option1-<?php echo $tabCount; ?>" class="tab-pane1"> 
                <!--<div class="alert alert-info">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldName']; ?>
                        </div>-->
                <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                <?php } ?>
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                <?php if($tabs['fieldType'] == 'select') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                      <?php
                                    }  ?>
                    </select>
                  </div>
                </div>
                <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="control-label col-sm-3">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                    <div class="radio checkbox">
                      <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                        <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                        <?php echo $options['optionValue']; ?> </label>
                    </div>
                    <?php }  ?>
                  </div>
                </div>
                <?php }else if($tabs['fieldType'] == 'text') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>"/>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span data-toggle="tooltip" title="<?php echo $tabs['fieldDes']; ?>"></span></label>
                  <div class="col-sm-9">
                    <textarea class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group date">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group time">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">Select date-time <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group datetime">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  } ?>
              </div>
              <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              
              <!--price-->
              <?php if(isset($mp_allowproductcolumn['price'])) { ?>
              <div class="form-group">
                  <div class="col-sm-9 priceerror">
                    <div class="DisPriLB">
                      <label class="control-label" for="input-price"><?php echo $entry_price; ?>
					  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="This is the price your customer will pay for your service. This does not reflect your take-home pay yet as a small platform fee will be deducted from this price.The price must be above or equal to 10SGD. If a discount is applied, the price minus the discount must be above or equal to 10SGD." data-original-title="" title=""></span>
					  </label>
                      <input type="number" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                      <span class="fa fa-usd"></span>
                    </div>
                    <div class="DisPriRB">
                      <label class="control-label" for="input-price"><?php echo $entry_discount; ?>
					  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Any discount or special offers you want to give customers should be added here.The price must be above or equal to 10SGD. If a discount is applied, the price minus the discount must be above or equal to 10SGD." data-original-title="" title=""></span>
					  </label>
                      <input type="number" name="discount_value" value="<?php echo $discount_value; ?>" placeholder="Discount Price" id="input-discount_value" class="form-control" style="width:58%; float:left;" />
                      <div class="DisPSec">
                        <div class="DisPSecL">
                          <input type="radio" name="discount_type" value="1" class="discount_type" <?php if($discount_type==1) { echo "checked"; }?> />
                          &nbsp;%</div>
                        <div class="DisPSecR">
                          <input type="radio" name="discount_type" value="0" class="discount_type" <?php if($discount_type==0) {echo "checked";} ?> />
                          &nbsp;$</div>
                      </div>
                    </div>
                    <input type="hidden" name="prevPrice" value="<?php echo $price; ?>" />
                  </div>
                </div>
                
                <table border="0" cellpadding="10" cellspacing="0" class="PriceSBox">
                  <tr>
                    <td width="56%" align="left" valign="top">Price</td>
                    <td align="left" valign="top" class="pricetbale_price"><?php echo $price; ?></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top">Discount </td>
                    <td align="left" valign="top" class="pricetbale_discountvalue"><?php echo $discount_value; ?></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top">Platform Fee<label class="fee control-label"><span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content='It is free to offer your Service in Zowedo, however we are charging a small platform fee on all your successful bookings which will be deducted from your payment. [Platform Fee FAQ]<br> 
					<a href="https://zowedo.zendesk.com/hc/en-us/articles/360000176711-How-much-do-i-have-to-pay-to-offer-my-services-on-Zowedo-" target="_blank"><font color="#ea9000">https://zowedo.zendesk.com/hc/en-us/articles/360000176711-How-much-do-i-have-to-pay-to-offer-my-services-on-Zowedo-</font></a>' data-original-title="" title=""></span></label>
					</td>
                    <td align="left" valign="top" class="pricetbale_servicefee"></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top">Take Home Fee </td>
                    <td align="left" valign="top" class="pricetbale_takehomefee"></td>
                  </tr>
                </table>

			  
              <?php } ?>
              <?php if(isset($mp_allowproductcolumn['quantity'])) { ?>
              <div class="form-group" style="display:none;">
                <label class="col-sm-3 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                <div class="col-sm-9">
                  <input type="text" name="quantity" value="1000" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                  
                  <!-- Membership code -->
                  <?php if(isset($wk_seller_group_status) && isset($marketplace_account_menu_sequence) && array_key_exists('membership', $marketplace_account_menu_sequence)) {  ?>
                  <input type="hidden" name="prevQuantity" id="prevQuantity" value="<?php echo $quantity; ?>"/>
                  <a href="#myModalanswer" id="showerror" role="button" class="hide tfbutton tfbuttonborder asub" data-toggle="modal"></a>
                  <?php } ?>
                  <!--  --> 
                </div>
              </div>
              <?php } ?>
              <!--for location type-->
			  
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
						<div class="modal-content">
						  <div class="modal-header" >
							<!--<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>-->
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							  <span aria-hidden="true">&times;</span>
							</button>
						  </div>
						  <div class="modal-body">
                <label class="control-label"><?php echo $text_praddress; echo '&nbsp;'; ?>
                <span class="pull-right pop" data-container="body" data-toggle="popover" data-placement="right" data-content="As part of our Verification Process, we will need you to provide your personal address to help us to confirm if you are an official resident allowed to offer your services in Singapore. We will also use this information to cross-check with your bank details when we transfer your pay."
  data-original-title="" title="" > </span></label>
  
                <br /><br />
             		<label><?php echo $text_postal_code; echo '&nbsp;'; ?><font color="#FF0000">*</font></label>	
                  <input type="text" name="postal_code" value="<?php echo $address['postcode'] ?>" id="postal_code" class="form-control" placeholder="Postal Code" /> 
				   <?php if(isset($postal_error) && $postal_error) { ?>
                    <div class="text-danger">
                        <?php echo $postal_error; ?>
                    </div>
                  <?php } ?>
				  <br clear="all" />
				  <!--<span class="pull-right GetAddT" style="margin:10px 0;cursor: pointer;">Get address by postal code</span>-->
                  <input type="button" class="GetAddT getadd" name="retrieve_add" id="GetAddT" value="Retrieve Address">
				  <label><?php echo $text_yourddress; echo '&nbsp;'; ?><font color="#FF0000">*</font></label>
				 <input type="text" name="address" value="<?php echo $address['address_1'] ?>" id="address" class="form-control" placeholder="Your Address" /> <br>
				  <?php if(isset($address_error) && $address_error) { ?>
                    <div class="text-danger">
                        <?php echo $postal_error; ?>
                    </div>
                  <?php } ?>
				 
				 <label><?php echo $text_floor; echo '&nbsp;'; ?><font color="#FF0000">*</font></label> 
					 <div class="floor_building">
				 	<div class="floor">
					<input type="text" name="floor" value="" id="floor" class="form-control" placeholder="Unit Number" /> 
					</div>
				 	
					<div class="building">
					<input type="text" name="building_name" value="" id="building_name" class="form-control" placeholder="Building Name"/>
					</div>
				 </div>
					 <?php if(isset($floor_error) && $floor_error) { ?>
                    <div class="text-danger">
                        <?php echo $floor_error; ?>
                    </div>
                  <?php } ?>
				
						  </div>
						  <div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" id="addAddress" class="btn btn-primary">Save changes</button>
						  </div>
						</div>
					  </div>
				</div>			  
              <?php  $tabCount = 5; $wkcustom_option_row = 5;
                  if(!empty($locationCustomFields)) { 
                    foreach($locationCustomFields as $tabs) { ?>
              <div id="wktab-option1-<?php echo $tabCount; ?>" class="tab-pane1"> 
                <!--<div class="alert alert-info">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldName']; ?>
                        </div>-->
                <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                <?php } ?>
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                <?php if($tabs['fieldType'] == 'select') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                      <?php
                                    }  ?>
                    </select>
                  </div>
                </div>
                <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                <div class="form-group NCheckBox <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="control-label col-sm-3">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9 location">
                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                    <div class="radio checkbox">
                      <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>" class="control-label">
                        <input type='<?php echo $tabs['fieldType']; ?>' class="servicetype" id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                        <?php echo $options['optionValue']; ?> 
						<!--<?php if($wkcustom_option_row.$options['optionId'] == 58) {?>
						  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="You will perform the Service at your Customer’s Preferred Venue" data-original-title="" title=""></span>
						  <?php }else if($wkcustom_option_row.$options['optionId'] == 59){ ?>
						   <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Service will be performed at your preferred Venue" data-original-title="" title=""></span>
						   <?php } ?>-->
						</label>
                    </div>
                    
                    <?php }  ?>
                  </div>
                </div>
                <?php }else if($tabs['fieldType'] == 'text') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span data-toggle="tooltip" title="<?php echo $tabs['fieldDes']; ?>"></span></label>
                  <div class="col-sm-9">
                    <textarea class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" placeholder="<?php  echo $tabs['fieldName']; ?>">
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group date">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group time">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">Select date-time <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group datetime">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  } ?>
              </div>
              <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
             
              <!--for zonesArray-->
              <div class="zonearray">
                <div class="form-group">
				<label class="home"><font color="#e09924"><b>You will perform the Service at your Customer’s Preferred Venue</b></font></label>
                  <label class="col-sm-2 control-label" for="input-filter"> <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $help_zone; ?>" data-original-title="" title=""  ><?php echo $entry_zone; ?></span></label>
				  
				  <div class="panel panel-default Multiple FilterSec">
				  <?php foreach($filter_data as $filter) { 
                				  if(in_array($filter['filter_id'],$filters)){
								  $checked = 'checked';
								  }else{
								  $checked = '';
								  } } ?>
							  <div class="panel-heading"> 
								  <label><input type="checkbox" name="product_filter[]" value="" class="checkall" id="checkall"> Singapore All</label></div>
								  
							  <div class="col-sm-12">
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $Central[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($Central as $center) { 
								  if(in_array($center['filter_id'],$filters)){
								  $checked = 'checked';
								  }else{
								  $checked = '';
								  } ?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $center['filter_id']; ?>"<?php echo $checked;?>><?php echo $center['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $East[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($East as $east_filter) {
								   if(in_array($east_filter['filter_id'],$filters)){
								  $checked = 'checked';
								  }else{
								  $checked = '';
								  } ?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $east_filter['filter_id']; ?>" <?php echo $checked;?>>
											<?php echo $east_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $West[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($West as $west_filter) {
								   if(in_array($west_filter['filter_id'],$filters)){
								  $checked = 'checked';
								  }else{
								  $checked = '';
								  } ?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $west_filter['filter_id']; ?>"<?php echo $checked;?>>
											<?php echo $west_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $South[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($South as $south_filter) {
								  if(in_array($south_filter['filter_id'],$filters)){
								  $checked = 'checked';
								  }else{
								  $checked = '';
								  } ?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $south_filter['filter_id']; ?>"<?php echo $checked;?>>
											<?php echo $south_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $North[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($North as $north_filter) { 
								  if(in_array($north_filter['filter_id'],$filters)){
								  $checked = 'checked';
								  }else{
								  $checked = '';
								  } ?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $north_filter['filter_id']; ?>"<?php echo $checked;?>>
											<?php echo $north_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
							
								
								  </div>
							  
							</div>
				  
                  <!--<div class="col-sm-10">
                    <input type="text" name="filter" value="" placeholder="Click here to add Home Services in Districts" id="input-filter" class="form-control" />
                    <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($product_filters as $product_filter) {  ?>
                      <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                        <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                      </div>
                      <?php } ?>
                    </div>
                  </div>-->
                </div>
              </div>
              
			  
              <!--for location address-->
			  <div class="locationaddress">
			  <?php  $tabCount = 7; $wkcustom_option_row = 7;
                  if(!empty($locationAddressCustomFields)) { 
                    foreach($locationAddressCustomFields as $tabs) { ?>
              
			  <div class="form-group">
			  <label class="home"><font color="#e09924"><b> Service will be performed at your preferred Venue</b></font></label>
                  <label class="col-sm-3 control-label"><?php  echo $tabs['fieldName']; ?>
				  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span>
                 	<a class="CharLMsg" data-toggle="modal" data-target="#exampleModal" style="font-weight:normal; cursor:pointer;">+Add address</a>
				  </label>
				  
                  <div class="col-sm-9 locationaddress1">
                   <select name="locationadd" id="locationadd" class="form-control" tabindex="9">
				   <option value="">Please select address</option>
                   <?php $count = 0; foreach ($address as $addres) {
                   		$add_id = $addres['address_id'];
				   		$addesslocation = $addres['address_1'].', '.$addres['address_2'].', '.$addres['city'].', '.$addres['postcode']; ?>
                       <option value="<?php echo $add_id; ?>" <?php if($tabs['fieldOptions']['option_id']== $add_id){ echo 'selected'; }?>><?php echo $addres['address_1'].' '.$addres['address_2'] ?></option>
                         <?php }?>
						</select>
                   
                  </div>
                </div>
				<?php $tabCount++; $wkcustom_option_row++; 
				} }?>
			 
                <?php  $tabCount = 7; $wkcustom_option_row = 7;
                  if(!empty($locationAddressCustomFields)) { 
                    foreach($locationAddressCustomFields as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2" style="display:none;"> 
                  <div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                          <?php echo $options['optionValue']; ?> </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
					  
					  <span class="pull-right" style="margin:10px 0;cursor: pointer;" data-toggle="modal" data-target="#exampleModal">+Add address</span>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" id="location1" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              </div>
            
              <!--for serviceDureationArray-->
              <div class="selectdureation form-group ">
                <label class="col-sm-3 control-label" for=" duration">Duration</label>
                <div class="col-sm-9">
                  <div class="selecthours"> <span class="hours">Hours</span>
                 
                    <select name="selecthours" id="selecthours" class="form-control">
                      <option value="" <?php if($hour==''){echo 'selected';} ?>>hours</option>
                      <option value="0" <?php if($hour=='0'){echo 'selected';} ?>>0</option>
                      <option value="60" <?php if($hour=='60'){echo 'selected';} ?>>1</option>
                      <option value="120" <?php if($hour=='120'){echo 'selected';} ?> >2</option>
                      <option value="180" <?php if($hour=='180'){echo 'selected';} ?> >3</option>
                      <option value="240" <?php if($hour=='240'){echo 'selected';} ?> >4</option>
                      <option value="300" <?php if($hour=='300'){echo 'selected';} ?> >5</option>
                      <option value="360" <?php if($hour=='360'){echo 'selected';} ?> >6</option>
                      <option value="420" <?php if($hour=='420'){echo 'selected';} ?> >7</option>
                      <option value="480" <?php if($hour=='480'){echo 'selected';} ?> >8</option>
                      <option value="540" <?php if($hour=='540'){echo 'selected';} ?> >9</option>
                      <option value="600" <?php if($hour=='600'){echo 'selected';} ?> >10</option>
                      <option value="660" <?php if($hour=='660'){echo 'selected';} ?> >11</option>
                      <option value="720" <?php if($hour=='720'){echo 'selected';} ?> >12</option>
                    </select>
                   
                  </div>
                  <div class="selectminiute"> <span class="minutes">Minutes</span>
                    <select name="selectminutes" id="selectminutes" class="form-control">
                      <option value="" <?php if($minutes==''){echo 'selected';} ?>>minutes</option>
                      <option value="0" <?php if($minutes=='0'){echo 'selected';} ?> >0</option>
                      <option value="1" <?php if($minutes=='1'){echo 'selected';} ?> >1</option>
                      <option value="2" <?php if($minutes=='2'){echo 'selected';} ?> >2</option>
                      <option value="3" <?php if($minutes=='3'){echo 'selected';} ?> >3</option>
                      <option value="4" <?php if($minutes=='4'){echo 'selected';} ?>>4</option>
                      <option value="5" <?php if($minutes=='5'){echo 'selected';} ?>>5</option>
                      <option value="6" <?php if($minutes=='6'){echo 'selected';} ?> >6</option>
                      <option value="7" <?php if($minutes=='7'){echo 'selected';} ?> >7</option>
                      <option value="8" <?php if($minutes=='8'){echo 'selected';} ?>>8</option>
                      <option value="9" <?php if($minutes=='9'){echo 'selected';} ?> >9</option>
                      <option value="10" <?php if($minutes=='10'){echo 'selected';} ?> >10</option>
                      <option value="11" <?php if($minutes=='11'){echo 'selected';} ?>>11</option>
                      <option value="12" <?php if($minutes=='12'){echo 'selected';} ?>>12</option>
                      <option value="13" <?php if($minutes=='13'){echo 'selected';} ?>>13</option>
                      <option value="14" <?php if($minutes=='14'){echo 'selected';} ?>>14</option>
                      <option value="15" <?php if($minutes=='15'){echo 'selected';} ?>>15</option>
                      <option value="16" <?php if($minutes=='16'){echo 'selected';} ?>>16</option>
                      <option value="17" <?php if($minutes=='17'){echo 'selected';} ?>>17</option>
                      <option value="18" <?php if($minutes=='18'){echo 'selected';} ?>>18</option>
                      <option value="19" <?php if($minutes=='19'){echo 'selected';} ?>>19</option>
                      <option value="20" <?php if($minutes=='20'){echo 'selected';} ?>>20</option>
                      <option value="21" <?php if($minutes=='21'){echo 'selected';} ?>>21</option>
                      <option value="22" <?php if($minutes=='22'){echo 'selected';} ?>>22</option>
                      <option value="23" <?php if($minutes=='23'){echo 'selected';} ?>>23</option>
                      <option value="24" <?php if($minutes=='24'){echo 'selected';} ?>>24</option>
                      <option value="25" <?php if($minutes=='25'){echo 'selected';} ?>>25</option>
                      <option value="26" <?php if($minutes=='26'){echo 'selected';} ?>>26</option>
                      <option value="27" <?php if($minutes=='27'){echo 'selected';} ?>>27</option>
                      <option value="28" <?php if($minutes=='28'){echo 'selected';} ?>>28</option>
                      <option value="29" <?php if($minutes=='29'){echo 'selected';} ?>>29</option>
                      <option value="30" <?php if($minutes=='30'){echo 'selected';} ?>>30</option>
                      <option value="31" <?php if($minutes=='31'){echo 'selected';} ?>>31</option>
                      <option value="32" <?php if($minutes=='32'){echo 'selected';} ?>>32</option>
                      <option value="33" <?php if($minutes=='33'){echo 'selected';} ?>>33</option>
                      <option value="34" <?php if($minutes=='34'){echo 'selected';} ?>>34</option>
                      <option value="35" <?php if($minutes=='35'){echo 'selected';} ?>>35</option>
                      <option value="36" <?php if($minutes=='36'){echo 'selected';} ?>>36</option>
                      <option value="37" <?php if($minutes=='37'){echo 'selected';} ?>>37</option>
                      <option value="38" <?php if($minutes=='38'){echo 'selected';} ?>>38</option>
                      <option value="39" <?php if($minutes=='39'){echo 'selected';} ?>>39</option>
                      <option value="40" <?php if($minutes=='40'){echo 'selected';} ?>>40</option>
                      <option value="41" <?php if($minutes=='41'){echo 'selected';} ?>>41</option>
                      <option value="42" <?php if($minutes=='42'){echo 'selected';} ?>>42</option>
                      <option value="43" <?php if($minutes=='43'){echo 'selected';} ?>>43</option>
                      <option value="44" <?php if($minutes=='44'){echo 'selected';} ?>>44</option>
                      <option value="45" <?php if($minutes=='45'){echo 'selected';} ?>>45</option>
                      <option value="46" <?php if($minutes=='46'){echo 'selected';} ?>>46</option>
                      <option value="47" <?php if($minutes=='47'){echo 'selected';} ?>>47</option>
                      <option value="48" <?php if($minutes=='48'){echo 'selected';} ?>>48</option>
                      <option value="49" <?php if($minutes=='49'){echo 'selected';} ?>>49</option>
                      <option value="50" <?php if($minutes=='50'){echo 'selected';} ?>>50</option>
                      <option value="51" <?php if($minutes=='51'){echo 'selected';} ?>>51</option>
                      <option value="52" <?php if($minutes=='52'){echo 'selected';} ?>>52</option>
                      <option value="53" <?php if($minutes=='53'){echo 'selected';} ?>>53</option>
                      <option value="54" <?php if($minutes=='54'){echo 'selected';} ?>>54</option>
                      <option value="55" <?php if($minutes=='55'){echo 'selected';} ?>>55</option>
                      <option value="56" <?php if($minutes=='56'){echo 'selected';} ?>>56</option>
                      <option value="57" <?php if($minutes=='57'){echo 'selected';} ?>>57</option>
                      <option value="58" <?php if($minutes=='58'){echo 'selected';} ?>>58</option>
                      <option value="59" <?php if($minutes=='59'){echo 'selected';} ?>>59</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="serviceDureationArray" style="display:none;">
                <?php  $tabCount = 8; $wkcustom_option_row = 8;
                  if(!empty($servicedurationCustomFields)) { 
                    foreach($servicedurationCustomFields as $tabs) { print_r($tabs);?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                          <?php echo $options['optionValue']; ?> </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <input class="form-control" id="serviceduration" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>"/>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              </div>
              
              <!--for max allowed-->
              <?php  $tabCount = 9; $wkcustom_option_row = 9;
                  if(!empty($maxallowedCustomFields)) { 
                    foreach($maxallowedCustomFields as $tabs) { ?>
              <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                <?php } ?>
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                <?php if($tabs['fieldType'] == 'select') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                      <?php
                                    }  ?>
                    </select>
                  </div>
                </div>
                <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="control-label col-sm-3">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                    <div class="radio checkbox">
                      <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                        <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                        <?php echo $options['optionValue']; ?> </label>
                    </div>
                    <?php }  ?>
                  </div>
                </div>
                <?php }else if($tabs['fieldType'] == 'text') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9 maxallerror">
                    <input class="form-control" id="maxallowed" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="max no. of participants" />
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group date">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group time">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group datetime">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  } ?>
              </div>
              <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              
              <!--for deadline to book service-->
              <?php  $tabCount = 10; $wkcustom_option_row = 10;
                  if(!empty($bookserviceCustomFields)) { 
                    foreach($bookserviceCustomFields as $tabs) { ?>
              <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                <?php } ?>
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                <?php if($tabs['fieldType'] == 'select') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                      <?php
                                    }  ?>
                    </select>
                  </div>
                </div>
                <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="control-label col-sm-3">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                    <div class="radio checkbox">
                      <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                        <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                        <?php echo $options['optionValue']; ?> </label>
                    </div>
                    <?php }  ?>
                  </div>
                </div>
                <?php }else if($tabs['fieldType'] == 'text') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <input class="form-control" id="serviceduration" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group date">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group time">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >

                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group datetime">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  } ?>
              </div>
              <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              
              <!--for servicetypeArray-->
              <?php  $tabCount = 11; $wkcustom_option_row = 11;
                  if(!empty($servicetypeCustomFields)) { 
                    foreach($servicetypeCustomFields as $tabs) { ?>
              <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                <?php } ?>
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                <?php if($tabs['fieldType'] == 'select') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                      <?php
                                    }  ?>
                    </select>
                  </div>
                </div>
                <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="control-label col-sm-3">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9 servicetypeerror">
                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                    <div class="radio checkbox">
                      <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>" class="control-label">
                        <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                        <?php echo $options['optionValue']; ?> 
						<?php if($wkcustom_option_row.$options['optionId'] == 1142) {?>
						  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Schedule your services as specific dates and times" data-original-title="" title=""></span>
						  <?php }else if($wkcustom_option_row.$options['optionId'] == 1143){ ?>
						   <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Maintain your availability in your calendar so that customers can book this service at any available time" data-original-title="" title=""></span>
						   <?php } ?>
						</label>
                    </div>
                    <?php }  ?>
                  </div>
                </div>
                <?php }else if($tabs['fieldType'] == 'text') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <input class="form-control" id="serviceduration" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-9">
                    <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group date">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group time">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                  <label class="col-sm-3 control-label">
                    <?php  echo $tabs['fieldName']; ?>
                    <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                  <div class="col-sm-6">
                    <div class="input-group datetime">
                      <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                      </span> </div>
                  </div>
                </div>
                <?php
                                  } ?>
              </div>
              <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              <?php } else {?>
			  
			  <div class="form-group" style="display:none;">
                <label class="col-sm-2 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
                <div class="col-sm-10">
               
                  <select name="subtract" id="input-subtract" class="form-control">
                    <?php if ($subtract) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            
			  <div class="form-group" style="display:none;">
                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="stock_status_id" id="input-stock-status" class="form-control">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
                    <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            
			  <div class="form-group" style="display:none;">
            
                <label class="col-sm-2 control-label"><?php echo $entry_shipping; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($shipping) { ?>
                    <input type="radio" name="shipping" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="shipping" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$shipping) {?>
                     <input type="radio" name="shipping" value="0" checked="checked"/>
                    
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                   <input type="radio" name="shipping" value="0"  />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>

              <div class="tab-content" id="wk_customfieldcontent"> 
                
                <!--for service type-->
                <?php  $tabCount = 1; $wkcustom_option_row = 1;
                  if(!empty($serviceArray)) { 
                    foreach($serviceArray as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 ">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 sessiontype">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> tabindex="0" />
                          <?php echo $options['optionValue']; ?> </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                       <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                <?php if(isset($mp_allowproducttabs['links'])){ ?>
                <input type="hidden" name="product_link_tab" value="1">
                <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-category"> <?php echo $entry_category; ?><!--<span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $help_category; ?>" data-original-title="" title=""  ></span>--></label>
                  <div class="col-sm-9 categoryerror">
                    <input type="text" name="category" value="" placeholder="Click here to add categories" id="input-category" class="form-control"/>
                    <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($product_categories as $product_category) { ?>
                      <div id="product-category<?php echo $product_category['category_id']; ?>" ><i class="fa fa-minus-circle "></i><?php echo $product_category['name']; ?>
                        <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" tabindex="1" />
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <?php } ?>
                
                <!--for service name-->
                <?php $count = 0; foreach ($languages as $language) { ?>
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?>
				  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content='Choosing a good Service Name is important to your business because it will be one of the first things a customer sees and will remember about you. Your Service name will help identify and separate you from the other vendors so choose a name that will really help you stand out. Here’s a guide to help you find a great Service Name <br> <a href="https://support.zowedo.com/partner-training" target="_blank" style ="color:#ea9000;">https://support.zowedo.com/partner-training</a>' data-original-title="" title=""></span></label>
                  <div class="col-sm-9 servicename">
                    <input maxlength="60" type="text" class="form-control" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" tabindex="2"/>
                    <?php if (isset($error_name[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php }?>
                
                <!--for service desctiption.-->
                <div class="form-group">
                  <label class="col-sm-3 control-label LisCLab" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description;?><h5 class="CharLMsg">Character limit: 500</h5></label>
               
			      <div class="col-sm-9 service_description">
                    <textarea tabindex="3" rows="7" maxlength="500" name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description1<?php echo $language['language_id']; ?>" class="form-control Hauto-Form"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                  </div>
                  <span id="characters"></span>
                </div>
                <?php $count = 0; foreach ($languages as $language) { ?>
                <div class="form-group required" style="display:none;">
                  <label class="col-sm-3 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                  <div class="col-sm-9">
                    <input maxlength="10" type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" />
                    <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php }?>
                
                <!--for whats included-->
                <?php  $tabCount = 2; $wkcustom_option_row = 2;
                  if(!empty($whatsincludeArray)) { 
                    foreach($whatsincludeArray as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
				
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
				 
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label"> 
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 whats_included">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" id="whats_included" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 whats_included">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                          <?php echo $options['optionValue']; ?> </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 whats_included">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" id="whats_included" />
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label LisCLab">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span><h5 class="CharLMsg">Character limit: 500</h5></label>
                    <div class="col-sm-9 whats_included_<?php echo $wkcustom_option_row; ?>">
                      <textarea maxlength="500" class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" id="whats_included_<?php echo $wkcustom_option_row; ?>" tabindex="4" placeholder="<?php  echo $tabs['fieldName']; ?>" ><?php if(isset($tabs['fieldOptions']['option_id'])) echo trim($tabs['fieldOptions']['option_id']); ?></textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                
                <!--for cancelation policy-->
                <?php  $tabCount = 4; $wkcustom_option_row = 4;
                  if(!empty($cancelpolicyArray)) { 
                    foreach($cancelpolicyArray as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 cancle">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" id="cancle" tabindex="5" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                          <?php echo $options['optionValue']; ?> </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                
                <!--for price-->
                <?php if(isset($mp_allowproductcolumn['price'])) { ?>
                <div class="form-group Test">
                  <div class="col-sm-9 priceerror">
                    <div class="DisPriLB">
                      <label class="control-label" for="input-price"><?php echo $entry_price; ?>
					  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="This is the price your customer will pay for your service. This does not reflect your take-home pay yet as a small platform fee will be deducted from this price.The price must be above or equal to 10SGD. If a discount is applied, the price minus the discount must be above or equal to 10SGD.
" data-original-title="" title=""></span>
					  </label>
                     <input type="number" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" tabindex="6"/> 
					 <span class="fa fa-usd"></span>
                    </div>
                    <div class="DisPriRB">
                      <label class="control-label" for="input-price"><?php echo $entry_discount; ?>
					  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Any discount or special offers you want to give customers should be added here.The price must be above or equal to 10SGD. If a discount is applied, the price minus the discount must be above or equal to 10SGD." data-original-title="" title=""></span>
					  </label>
                      <input type="number" name="discount_value" value="<?php echo $discount_value; ?>" placeholder="Discount Price" id="input-discount_value" class="form-control" style="width:58%; float:left;" />
                      <div class="DisPSec">
                        <div class="DisPSecL">
                          <input type="radio" name="discount_type" value="1" class="discount_type" />
                          &nbsp;%</div>
                        <div class="DisPSecR">
                          <input type="radio" name="discount_type" value="0" class="discount_type" />
                          &nbsp;$</div>
                      </div>
                    </div>
                    <input type="hidden" name="prevPrice" value="<?php echo $price; ?>" />
                  </div>
                </div>
				<table border="0" cellpadding="10" cellspacing="0" class="PriceSBox">
                  <tr>
                    <td width="50%" align="left" valign="top">Price</td>
                    <td align="left" valign="top" class="pricetbale_price"><?php echo $price; ?></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top">Discount </td>
                    <td align="left" valign="top" class="pricetbale_discountvalue"><?php echo $discount_value; ?></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top">Platform Fee<label class="fee control-label"><span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content='It is free to offer your Service in Zowedo, however we are charging a small platform fee on all your successful bookings which will be deducted from your payment. [Platform Fee FAQ]<br> 
					<a href="https://zowedo.zendesk.com/hc/en-us/articles/360000176711-How-much-do-i-have-to-pay-to-offer-my-services-on-Zowedo" target="_blank"><font color="#ea9000">https://zowedo.zendesk.com/hc/en-us/articles/360000176711-How-much-do-i-have-to-pay-to-offer-my-services-on-Zowedo</font></a>' data-original-title="" title=""></span></label>
					
					</td>
                    <td align="left" valign="top" class="pricetbale_servicefee"></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top">Take Home Fee </td>
                    <td align="left" valign="top" class="pricetbale_takehomefee"></td>
                  </tr>
                </table>

				
                <?php } ?>
                <?php if(isset($mp_allowproductcolumn['quantity'])) { ?>
                <div class="form-group" style="display:none;">
                  <label class="col-sm-3 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="quantity" value="1000" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                    
                    <!-- Membership code -->
                    <?php if(isset($wk_seller_group_status) && isset($marketplace_account_menu_sequence) && array_key_exists('membership', $marketplace_account_menu_sequence)) {  ?>
                    <input type="hidden" name="prevQuantity" id="prevQuantity" value="<?php echo $quantity; ?>"/>
                    <a href="#myModalanswer" id="showerror" role="button" class="hide tfbutton tfbuttonborder asub" data-toggle="modal"></a>
                    <?php } ?>
                    <!--  --> 
                  </div>
                </div>
                <?php } ?>
				
				
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
						<div class="modal-content">
							<button style="padding:0px; position:absolute; right:10px; top:10px; z-index:999;" type="button" class="close" data-dismiss="modal" aria-label="Close">
							  <span aria-hidden="true">&times;</span>
							</button>
						  <div class="modal-body">
                <label class="control-label"><strong><?php echo $text_praddress; echo '&nbsp;'; ?></strong>
                <span class="pull-right pop" data-container="body" data-toggle="popover" data-placement="right" data-content="As part of our Verification Process, we will need you to provide your personal address to help us to confirm if you are an official resident allowed to offer your services in Singapore. We will also use this information to cross-check with your bank details when we transfer your pay."
  data-original-title="" title="" > </span></label>
  
                <br /><br />
             		<label><?php echo $text_postal_code; echo '&nbsp;'; ?><font color="#FF0000">*</font></label>	
                  <input type="text" name="postal_code" value="<?php echo $address['postcode'] ?>" id="postal_code" class="form-control" placeholder="Postal Code" /> 
				   <?php if(isset($postal_error) && $postal_error) { ?>
                    <div class="text-danger">
                        <?php echo $postal_error; ?>
                    </div>
                  <?php } ?>
				  <br clear="all" />
				  <!--<span class="pull-right GetAddT" style="margin:10px 0;cursor: pointer;">Get address by postal code</span>-->
					<input type="button" class="GetAddT getadd" name="retrieve_add" value="Retrieve Address">                  
				  <label><?php echo $text_yourddress; echo '&nbsp;'; ?><font color="#FF0000">*</font></label>
				 <input type="text" name="address" value="<?php echo $address['address_1'] ?>" id="address" class="form-control" placeholder="Your Address" /> <br>
				  <?php if(isset($address_error) && $address_error) { ?>
                    <div class="text-danger">
                        <?php echo $postal_error; ?>
                    </div>
                  <?php } ?>
				 
				 <label><?php echo $text_floor; echo '&nbsp;'; ?><font color="#FF0000">*</font></label> 
				 <div class="floor_building">
				 	<div class="floor">
					<input type="text" name="floor" value="" id="floor" class="form-control" placeholder="Unit Number" /> 
					</div>
				 	
					<div class="building">
					<input type="text" name="building_name" value="" id="building_name" class="form-control" placeholder="Building Name"/>
					</div>
				 </div>
			 <?php if(isset($floor_error) && $floor_error) { ?>
                    <div class="text-danger">
                        <?php echo $floor_error; ?>
                    </div>
                  <?php } ?>
				
						  </div>
						  <div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" id="addAddress"  class="btn btn-primary">Save changes</button>
						  </div>
						</div>
					  </div>
				</div>
                <!--for locationtypeArray-->
                <?php  $tabCount = 5; $wkcustom_option_row = 5;
                  if(!empty($locationtypeArray)) { 
                    foreach($locationtypeArray as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 location">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>" class="control-label">
                          <input type='<?php echo $tabs['fieldType']; ?>' class="servicetype" id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> tabindex="7"/>
                          <?php echo $options['optionValue']; ?> 
						  <!--<?php if($wkcustom_option_row.$options['optionId'] == 58) {?>
						  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="You will perform the Service at your Customer’s Preferred Venue" data-original-title="" title=""></span>
						  <?php }else if($wkcustom_option_row.$options['optionId'] == 59){ ?>
						   <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Service will be performed at your preferred Venue" data-original-title="" title=""></span>
						   <?php } ?>-->					  
						  </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span>
					  </label>
					  
                    <div class="col-sm-9">
					  <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                
                <!--for zonesArray-->
                <div class="zonearray">
                  <div class="form-group">
				  <label class="home"><font color="#e09924"><b>You will perform the Service at your Customer’s Preferred Venue</b></font></label>
                    <label class="col-sm-2 control-label" for="input-filter"> <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $help_zone; ?>" data-original-title="" title=""  ><?php echo $entry_zone; ?></span></label>
                    
                    <!--<div class="CatLocBox">
                       <h1>Sort By:</h1> 
                          <div class="CatLocBoxM">
                            <label>Location:</label>
                            <select>
                                <option value="N">All</option>  
                                <option value="Y"> Multiple</option>           
                            </select>
                          </div>
                     </div>-->
                     <div class="panel panel-default Multiple FilterSec">
							  <div class="panel-heading"><label><input type="checkbox" name="product_filter[]" value="" class="selectall" id="selectall" /> Singapore All</label></div>
							  <div class="col-sm-12">
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $Central[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($Central as $center) {?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $center['filter_id']; ?>"><?php echo $center['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $East[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($East as $east_filter) {?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $east_filter['filter_id']; ?>">
											<?php echo $east_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $West[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($West as $west_filter) {?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $west_filter['filter_id']; ?>">
											<?php echo $west_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $South[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($South as $south_filter) {?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $south_filter['filter_id']; ?>">
											<?php echo $south_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
								
								<div class="col-sm-3">
								<a class="list-group-item"><?php echo $North[0]['group']?></a>
								<div class="list-group-item">
								  <div id="filter-group1">
								  <?php foreach($North as $north_filter) {?>
									<div class="checkbox">
										  <label>
											<input type="checkbox" name="product_filter[]" value="<?php echo $north_filter['filter_id']; ?>">
											<?php echo $north_filter['name']; ?>
										  </label>
									</div>
									<?php } ?>
								</div>
								</div>
								</div>
							
								
								  </div>
							  </div>
                    <!--<div class="col-sm-10 ABC">
                      <input type="text" name="filter" value="" placeholder="Click here to add Home Services in Districts" id="input-filter" class="form-control" tabindex="8"/>
                      <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                        <?php foreach ($product_filters as $product_filter) { print_r($product_filter); exit;?>
                        <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                          <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                    </div>-->
                    
                  </div>
                </div>
				
				 <div class="locationaddress">
					<?php  $tabCount = 7; $wkcustom_option_row = 7;
                 	 if(!empty($locationaddressArray)) { 
                   	 foreach($locationaddressArray as $tabs) { ?>
			   
                
               			 <!--for location address-->
				
               			 <div class="form-group">
				<label class="home"><font color="#e09924"><b> Service will be performed at your preferred Venue</b></font></label>
                   <label class="col-sm-3 control-label"><div style="float:left;"><?php  echo $tabs['fieldName']; ?><span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></div> <a class="LCharLMsg" data-toggle="modal" data-target="#exampleModal">+Add address</a></label>
  				   
                  <div class="col-sm-9 locationaddress1">
                   <select name="locationadd" id="locationadd" class="form-control" tabindex="9">
				   <option value="">Please select address</option>
                   <?php $count = 0; foreach ($address as $addres) { ?>
                   		
                        <option value="<?php echo $addres['address_id']?>"><?php echo $addres['address_1'].' '.$addres['address_2'] ?></option>
                         <?php }?>
						</select>
                  
                  </div>
                </div>
               		<?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                
				
                  <?php  $tabCount = 7; $wkcustom_option_row = 7;
                  if(!empty($locationaddressArray)) { 
                    foreach($locationaddressArray as $tabs) { ?>
                  <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2" style="display:none;"> 
                    <div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>
                    <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                    <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                    <?php } ?>
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                    <?php if($tabs['fieldType'] == 'select') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-9">
                        <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                          <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                          <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                          <?php
                                    }  ?>
                        </select>
                      </div>
                    </div>
                    <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                    <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="control-label col-sm-3">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-9">
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <div class="radio checkbox">
                          <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                            <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                            <?php echo $options['optionValue']; ?> </label>
                        </div>
                        <?php }  ?>
                      </div>
                    </div>
                    <?php }else if($tabs['fieldType'] == 'text') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
					
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span>
						</label>
						<span class="pull-right" style="margin:10px 0;cursor: pointer;" data-toggle="modal" data-target="#exampleModal">+Add address</span>
                      <div class="col-sm-9">
                        <input class="form-control" id="location1" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" tabindex="9" />
                      </div>
                    </div>
                    <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-9">
                        <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7"  placeholder="<?php  echo $tabs['fieldName']; ?>">
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                      </div>
                    </div>
                    <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-6">
                        <div class="input-group date">
                          <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                          <span class="input-group-btn">
                          <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                          </span> </div>
                      </div>
                    </div>
                    <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-6">
                        <div class="input-group time">
                          <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                          <span class="input-group-btn">
                          <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                          </span> </div>
                      </div>
                    </div>
                    <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                    <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-6">
                        <div class="input-group datetime">
                          <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                          <span class="input-group-btn">
                          <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                          </span> </div>
                      </div>
                    </div>
                    <?php
                                  } ?>
                  </div>
                  <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
					  
					
                </div>
                
                <!--for serviceDureationArray-->
                <div class="selectdureation form-group ">
                  <label class="col-sm-3 control-label" for=" duration">Duration</label>
                  <div class="col-sm-9">
                    <div class="selecthours"> <span class="hours">Hours</span>
                      <select name="selecthours" id="selecthours" class="form-control" tabindex="10">
                        <option value="0">hours</option>
                        <option value="0">0</option>
                        <option value="60" selected="selected">1</option>
                        <option value="120">2</option>
                        <option value="180">3</option>
                        <option value="240">4</option>
                        <option value="300">5</option>
                        <option value="360">6</option>
                        <option value="420">7</option>
                        <option value="480">8</option>
                        <option value="540">9</option>
                        <option value="600">10</option>
                        <option value="660">11</option>
                        <option value="720">12</option>
                      </select>
                    </div>
                    <div class="selectminiute"> <span class="minutes">Minutes</span>
                      <select name="selectminutes" id="selectminutes" class="form-control" tabindex="11">
                        <option value="0">minutes</option>
                        <option value="0"  selected="selected">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                        <option value="32">32</option>
                        <option value="33">33</option>
                        <option value="34">34</option>
                        <option value="35">35</option>
                        <option value="36">36</option>
                        <option value="37">37</option>
                        <option value="38">38</option>
                        <option value="39">39</option>
                        <option value="40">40</option>
                        <option value="41">41</option>
                        <option value="42">42</option>
                        <option value="43">43</option>
                        <option value="44">44</option>
                        <option value="45">45</option>
                        <option value="46">46</option>
                        <option value="47">47</option>
                        <option value="48">48</option>
                        <option value="49">49</option>
                        <option value="50">50</option>
                        <option value="51">51</option>
                        <option value="52">52</option>
                        <option value="53">53</option>
                        <option value="54">54</option>
                        <option value="55">55</option>
                        <option value="56">56</option>
                        <option value="57">57</option>
                        <option value="58">58</option>
                        <option value="59">59</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="serviceDureationArray" style="display:none;">
                  <?php  $tabCount = 8; $wkcustom_option_row = 8;
                  if(!empty($serviceDureationArray)) { 
                    foreach($serviceDureationArray as $tabs) { ?>
                  <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                    <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                    <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                    <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                    <?php } ?>
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                    <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                    <?php if($tabs['fieldType'] == 'select') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-9">
                        <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                          <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                          <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                          <?php }  ?>
                        </select>
                      </div>
                    </div>
                    <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                    <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="control-label col-sm-3">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-9">
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <div class="radio checkbox">
                          <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                            <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                            <?php echo $options['optionValue']; ?> </label>
                        </div>
                        <?php }  ?>
                      </div>
                    </div>
                    <?php }else if($tabs['fieldType'] == 'text') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-9">
                        <input class="form-control totalcount" id="serviceduration" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" tabindex="12"/>
                      </div>
                    </div>
                    <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-9">
                        <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                      </div>
                    </div>
                    <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-6">
                        <div class="input-group date">
                          <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                          <span class="input-group-btn">
                          <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                          </span> </div>
                      </div>
                    </div>
                    <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                    <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-6">
                        <div class="input-group time">
                          <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                          <span class="input-group-btn">
                          <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                          </span> </div>
                      </div>
                    </div>
                    <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                    <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                      <label class="col-sm-3 control-label">
                        <?php  echo $tabs['fieldName']; ?>
                        <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                      <div class="col-sm-6">
                        <div class="input-group datetime">
                          <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                          <span class="input-group-btn">
                          <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                          </span> </div>
                      </div>
                    </div>
                    <?php
                                  } ?>
                  </div>
                  <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                </div>
                
                <!--for max allowed-->
                <?php  $tabCount = 9; $wkcustom_option_row = 9;
                  if(!empty($maxallowedArray)) { 
                    foreach($maxallowedArray as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                          <?php echo $options['optionValue']; ?> </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 maxallerror">
                      <input class="form-control" id="maxallowed" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="max no. of participants" tabindex="13"/>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" placeholder="<?php  echo $tabs['fieldName']; ?>">
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id'];  ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                
                <!--for deadline to book service-->
                <?php  $tabCount = 10; $wkcustom_option_row = 10;
                  if(!empty($deadlineArray)) { 
                    foreach($deadlineArray as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" tabindex="14">
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                          <?php echo $options['optionValue']; ?> </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <input class="form-control" id="serviceduration" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" placeholder="<?php  echo $tabs['fieldName']; ?>" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
                
                <!--for servicetypeArray-->
                <?php  $tabCount = 11; $wkcustom_option_row = 11;
                  if(!empty($servicetypeArray)) { 
                    foreach($servicetypeArray as $tabs) { ?>
                <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2"> 
                  <!--<div class="alert alert-info col-sm-9">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>-->
                  <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                  <div class="alert alert-danger"> <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_mandetory; ?> </div>
                  <?php } ?>
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                  <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                  <?php if($tabs['fieldType'] == 'select') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                        <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                        <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> > <?php echo $options['optionValue']; ?> </option>
                        <?php
                                    }  ?>
                      </select>
                    </div>
                  </div>
                  <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                  <div class="NCheckBox form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="control-label col-sm-3">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 servicetypeerror">
                      <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                      <div class="radio checkbox">
                        <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>" class="control-label">
                          <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> tabindex="15" />
                          <?php echo $options['optionValue']; ?> 
						  <?php if($wkcustom_option_row.$options['optionId'] == 1142) {?>
						  <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Schedule your services as specific dates and times" data-original-title="" title=""></span>
						  <?php }else if($wkcustom_option_row.$options['optionId'] == 1143){ ?>
						   <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="Maintain your availability in your calendar so that customers can book this service at any available time" data-original-title="" title=""></span>
						   <?php } ?>
						  </label>
                      </div>
                      <?php }  ?>
                    </div>
                  </div>
                  <?php }else if($tabs['fieldType'] == 'text') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9 servicetypeerror">
                      <input class="form-control" id="serviceduration" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" placeholder="<?php  echo $tabs['fieldName']; ?>" />
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-9">
                      <textarea class="form-control Hauto-Form" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" placeholder="<?php  echo $tabs['fieldName']; ?>" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group date">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-calendar"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                  <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                    <label class="col-sm-3 control-label">
                      <?php  echo $tabs['fieldName']; ?>
                      <span class="pop" data-container="body" data-toggle="popover" data-placement="right" data-content="<?php echo $tabs['fieldDes']; ?>" data-original-title="" title=""></span></label>
                    <div class="col-sm-6">
                      <div class="input-group datetime">
                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"> <i class="fa fa-clock-o"></i> </button>
                        </span> </div>
                    </div>
                  </div>
                  <?php
                                  } ?>
                </div>
                <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              </div>
              <?php } ?>
            </div>
            <!--tab-content-language--> 
            <br clear="all" />
            <br />
            <div class=""> <a style="cursor:pointer; margin:0px;" class="AUpoBut nexttoimg" >Next</a> 
              <!--<a style="cursor:pointer;" onclick="$('#form-save').submit();" data-toggle="tooltip" class="AUpoBut" title="<?php echo $button_continue; ?>" id="submit">Save</a>-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_back; ?>" class="ASkiBut" data-original-title="Cancel">Back</a> </div>
          </div>
          
          <!-- link tab --> 
          
          <!-- discount tab -->
          <?php if(isset($mp_allowproducttabs['discount'])){ ?>
          <input type="hidden" name="product_discount_tab" value="1">
          <div class="tab-pane" id="tab-discount">
            <div class="table-responsive">
              <table id="discount" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left"><?php echo $entry_customer_group; ?></td>
                    <td class="text-right"><?php echo $entry_quantity; ?></td>
                    <td class="text-right" style="min-width:70px"><?php echo $entry_priority; ?></td>
                    <td class="text-right" style="min-width:80px"><?php echo $entry_price; ?></td>
                    <td class="text-left"><?php echo $entry_date_start; ?></td>
                    <td class="text-left"><?php echo $entry_date_end; ?></td>
                    <td></td>
                  </tr>
                </thead>
                <?php $discount_row = 0; ?>
                <?php foreach ($product_discounts as $product_discount) { ?>
                <tbody id="discount-row<?php echo $discount_row; ?>">
                  <tr>
                    <td class="text-left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                        <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select></td>
                    <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                    <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                    <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                    <td class="text-left"><div class="input-group date">
                        <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span></div></td>
                    <td class="text-left"><div class="input-group date">
                        <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span></div></td>
                    <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                  </tr>
                </tbody>
                <?php $discount_row++; ?>
                <?php } ?>
                <tfoot>
                  <tr>
                    <td colspan="6"></td>
                    <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_add_discount; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
          <!--tab-discount-->
          <?php } ?>
          
          <!--tab-special-->
          <?php if(isset($mp_allowproducttabs['special'])){ ?>
          <input type="hidden" name="product_special_tab" value="1">
          <div class="tab-pane" id="tab-special" style="display:none;">
            <div class="table-responsive">
              <table id="special" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left"><?php echo $entry_customer_group; ?></td>
                    <td class="text-right" style="min-width:70px"><?php echo $entry_priority; ?></td>
                    <td class="text-right" style="min-width:80px"><?php echo $entry_price; ?></td>
                    <td class="text-left"><?php echo $entry_date_start; ?></td>
                    <td class="text-left"><?php echo $entry_date_end; ?></td>
                    <td></td>
                  </tr>
                </thead>
                  <?php 
                  if($update_dive!=1 or empty($product_specials)) { ?>
                <?php $special_row = 0; 
                $totalrows = count($customer_groups);
               
               for($i=0;$i<$totalrows;$i++)
               {
                ?>
                <tbody id="special-row<?php echo $special_row; ?>">
                  <tr>
                    <td class="text-left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                        <?php foreach ($customer_groups as $customer_group) {
                    
                         ?>
                        <?php if ($customer_group['customer_group_id'] == $i) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select></td>
                    <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                    <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                    <td class="text-left"><div class="input-group date">
                        <input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span></div></td>
                    <td class="text-left"><div class="input-group date">
                        <input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span></div></td>
                    <td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                  </tr>
                </tbody>
                <?php $special_row++; 
                }
                }
                ?>
                <?php 
                $special_row = 0;
                foreach ($product_specials as $product_special) {
                  ?>
                <tbody id="special-row<?php echo $special_row; ?>">
                  <tr>
                    <td class="text-left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                        <?php foreach ($customer_groups as $customer_group) {
                    
                         ?>
                        <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select></td>
                    <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                    <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                    <td class="text-left"><div class="input-group date">
                        <input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span></div></td>
                    <td class="text-left"><div class="input-group date">
                        <input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span></div></td>
                    <td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                  </tr>
                </tbody>
                <?php $special_row++; ?>
                <?php } 
                ?>
                <tfoot>
                  <tr>
                    <td colspan="5"></td>
                    <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_add_special; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
          <!--tab-special-->
          <?php } ?>
          
          <!--tab-image-->
          <?php $image_row = 0; ?>
          <?php if(isset($mp_allowproductcolumn['image'])) { ?>
		   
          <div class="tab-pane " id="tab-image">
		  <div class="form-group">
		   <label class="col-sm-12 control-label" for="input-keyword">Video</label>
              <div class="col-sm-9">
 			   	<input type="text" name="product_video" value="<?php if($product_videos){echo $product_videos[0]['video'];} ?>" id="video-target-video" placeholder="Youtube video link" class="form-control"/>
 				  </div>
		  </div>
            <div class="form-group">
			
              <label class="col-sm-12 control-label"><?php echo $entry_image; ?></label>
			  <h5 class="col-sm-12" style="color:#b0b0b0; font-size:12px; margin-bottom:20px;"><?php echo $text_main_image; ?></h5>
			  
			  
              <div class="col-sm-12 RemoveImgB imagecheck">
                <div style="width:110px;height:100px;overflow:hidden" class="img-thumbnail wk_upload_img"> <img id="image-thumb-image" src="<?php echo $thumb; ?>" alt="" title=""/> </div>
                <input type="hidden" name="image" value="<?php echo $thumb_img; ?>" id="image-target-image"/>

                <script type="text/javascript">
                  $(document).ready(function() {
                    setInterval(function() {
                      $('.open-crop').each(function() {
                        if ($(this).siblings('input[type="hidden"]').val()) {
                          $(this).show();
                        } else {
                          $(this).hide();
                        }
                      });
                    }, 100);
                  });
                </script>
				
                <button class="ARemvB delete_img" type="button">
					<i class="fa fa-trash" aria-hidden="true"></i>
				</button>
                <?php if ($thumb_img) { ?>
                <i style="font-size: 20px;margin-left: 5px;color: #f69a00;" class="open-crop fa fa-crop" onclick="openCrop('<?php echo $thumb_img; ?>', 'image-thumb-image');"></i>
                <?php } else { ?>
                <i style="font-size: 20px;margin-left: 5px;color: #f69a00;display:none;" class="open-crop fa fa-crop" onclick="openCrop($('#image-target-image').val(), 'image-thumb-image');"></i>
                <?php } ?>
                <div class="btn-group" style="display:none;">
                  <button class="LisImgBut delete_img" type="button"> <i class="fa fa-trash" aria-hidden="true"></i></button>
                </div>
              </div>
            </div>
            <div class="">
              <table id="images" class="table table-striped table-bordered table-hover" border="">
                <thead>
                  <tr>
                    <td align="left" valign="middle"><h5 style="float:left;"><strong><?php echo $entry_additionalimage; ?></strong></h5>&nbsp;<h5 class="AForJTxt"><?php echo $text_addtional_image; ?></h5><div class="alert alert-danger imageerror" id="alert-danger"><i class="fa fa-exclamation-circle"></i> Warning: you can not add more image!</div></td>
                     <!-- <td class="text-right"><?php echo $entry_sort_order; ?></td>--> 
                    
                  </tr>
                </thead>
                <?php foreach ($product_images as $product_image) { ?>
                <tbody id="image-row<?php echo $image_row; ?>">
                  <tr>
                    <td class="text-left"><div class="img-thumbnail wk_upload_img"> <img id="thumb<?php echo $image_row; ?>-thumb-image" src="<?php echo $product_image['thumb'] ? $product_image['thumb'] : $placeholder; ?>" alt="" title=""/> </div>
                      <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['thumg_img']; ?>" id="thumb<?php echo $image_row; ?>-target-image"/>
                      
                      <!-- <div class="btn-group imgoption" style="width: 41%;">
                      <button class="btn btn-danger btn-sm delete_img" type="button">Remove</button>
                    </div>--> 
                      
                      <!--<td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>-->
                      <button class="ARemvB" onclick="$('#image-row<?php echo $image_row; ?>').remove();" type="button"><i class="fa fa-trash" aria-hidden="true"></i></button>
                      <?php if ($product_image['thumg_img']) { ?>
                      <i style="font-size: 20px;margin-left: 5px;color: #f69a00;" class="open-crop fa fa-crop" onclick="openCrop('<?php echo $product_image['thumg_img']; ?>', 'thumb<?php echo $image_row; ?>-thumb-image');"></i>
                      <?php } else { ?>
                      <i style="font-size: 20px;margin-left: 5px;color: #f69a00;display:none;" class="open-crop fa fa-crop" onclick="openCrop($('#thumb<?php echo $image_row; ?>-target-image').val(), 'thumb<?php echo $image_row; ?>-thumb-image');"></i>
                      <?php } ?>
                      <!--<button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="LisImgBut">Remove</button>-->
                      </td>
                  </tr>
                </tbody>
                <?php $image_row++; ?>
                <?php } ?>
                <tfoot>
                  <tr>
                    <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" class="btn btn-primary PlusIA"><i class="fa fa-plus-circle"></i></button></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
          <!--tab-image-->
          <?php } ?>
          <?php if(isset($mp_allowproducttabs['custom-field'])) { ?>
          <!-- <div id="tab-custom-field" class="tab-pane">
          <div class="row">
            <div class="col-sm-3">
              <ul class="nav nav-pills nav-stacked" id="vtab-option">
                  <?php  $tabCount = 0; $wkcustom_option_row = 0;?>
                    <?php if(!empty($wkPreCustomFields)) { ?>
                      <?php foreach($wkPreCustomFields as $tabs) { ?>
                        <li>
                          <a href="#wktab-option-<?php echo $tabCount; ?>" data-toggle="tab" id="wkoption-<?php echo $tabCount; ?>" field-id = "wkoption-<?php echo $tabs['fieldId'];?>"><i class="fa fa-minus-circle" onclick="$('#wkoption-<?php echo $tabCount; ?>').remove(); $('#wktab-option-<?php echo $tabCount; ?>').remove(); $('#vtab-option li a:first').trigger('click'); return false;"></i><?php echo $tabs["fieldName"]; ?></a>
                        </li>
                      <?php $tabCount++; ?>
                    <?php } ?>
                  <?php } ?>
                  <li id="optionSelector">
                    <select name="wkcustomfield" class="form-control">
                      <?php if(!empty($wkcustomFields)){ ?>
                        <option value=""></option>
                          <?php  foreach($wkcustomFields as $field) { ?>
                            <option value="<?php echo $field['id']; ?>" data-type = "<?php echo $field['fieldType']; ?>" data-name="<?php echo $field['fieldName']; ?>" data-des="<?php echo $field['fieldDescription']; ?>" title="<?php echo $field['fieldDescription']; ?>" data-isRequired = "<?php echo $field['isRequired']; ?>">
                              <?php echo $field['fieldName']; ?>
                            </option>
                          <?php 
                          } 
                        }
                      ?>
                    </select>
                  </li>  
              </ul>
            </div>
            <div class="col-sm-9">
              <div class="tab-content" id="wk_customfieldcontent">
                <?php  $tabCount = 0; $wkcustom_option_row = 0;
                  if(!empty($customFields)) { 
                    foreach($customFields as $tabs) { ?>
                      <div id="wktab-option-<?php echo $tabCount; ?>" class="tab-pane2">
                        <div class="alert alert-info">
                          <i class="fa fa-info-circle"></i>
                          <?php  echo $tabs['fieldDes']; ?>
                        </div>
                        <?php if(isset($error) && $error == $tabs['fieldId']) { ?>
                            <div class="alert alert-danger">
                              <i class="fa fa-exclamation-circle"></i>
                              <?php echo $error_warning_mandetory; ?>
                            </div>
                        <?php } ?>
                        <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_name]" value="<?php echo $tabs['fieldName']; ?>">
                        <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_type]" value="<?php echo $tabs['fieldType']; ?>">
                        <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_id]" value="<?php echo $tabs['fieldId']; ?>">
                        <input type="hidden" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_des]" value="<?php echo $tabs['fieldDes']; ?>">
                            <?php if($tabs['fieldType'] == 'select') { ?>
                              <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                                <label class="col-sm-3 control-label">Select option:</label>
                                <div class="col-sm-9">
                                  <select class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" >
                                    <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                                      <option value="<?php echo $options['optionId']; ?>" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "selected"; } } ?> >
                                        <?php echo $options['optionValue']; ?>
                                      </option>
                                    <?php
                                    }  ?>
                                  </select>
                                </div>
                               </div>
                              <?php 
                              
                              }else if($tabs['fieldType'] == 'checkbox' || $tabs['fieldType'] == 'radio' ) { ?>
                                <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                                <label class="control-label col-sm-3">Select option:</label>
                                <div class="col-sm-9">
                              <?php  foreach($tabs['preFieldOptions'] as $options) { ?>
                                
                                  <div class="radio checkbox">
                                    <label for="<?php echo $wkcustom_option_row.$options['optionId']; ?>">
                                      <input type='<?php echo $tabs['fieldType']; ?>' id="<?php echo $wkcustom_option_row.$options['optionId']; ?>" value="<?php echo $options['optionId']; ?>" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" <?php if(!empty($tabs['fieldOptions'])) { foreach($tabs['fieldOptions'] as $option) { if($option['optionId'] == $options['optionId']) echo "checked"; } } ?> />
                                      <?php echo $options['optionValue']; ?>
                                    </label>
                                  </div>
                               
                              <?php }  ?>
                               </div>
                              </div>
                              <?php }else if($tabs['fieldType'] == 'text') { ?>
                                <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                                  <label class="col-sm-3 control-label">Enter Text:</label>
                                  <div class="col-sm-9">
                                    <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" />
                                  </div>
                                </div>
                                <?php
                                }else if($tabs['fieldType'] == 'textarea') { ?>
                                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                                    <label class="col-sm-3 control-label">Enter Text:</label>
                                    <div class="col-sm-9">
                                      <textarea class="form-control" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" rows="7" >
                                      <?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>
                                    </textarea>
                                    </div>
                                  </div>
                                <?php
                                }else if($tabs['fieldType'] == 'date') { ?>
                                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                                    <label class="col-sm-3 control-label">Select Date:</label>
                                    <div class="col-sm-6">
                                      <div class="input-group date">
                                        <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                                        <span class="input-group-btn">
                                          <button type="button" class="btn btn-default">
                                            <i class="fa fa-calendar"></i>
                                          </button>
                                        </span>
                                      </div>
                                    </div>
                                  </div>
                                <?php
                                }else if($tabs['fieldType'] == 'time') { ?>
                                  <div class="form-group <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                                    <label class="col-sm-3 control-label">Enter Text:</label>
                                    <div class="col-sm-6">
                                      <div class="input-group time">
                                         <input class="form-control" type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" >
                                        <span class="input-group-btn">
                                          <button type="button" class="btn btn-default">
                                            <i class="fa fa-clock-o"></i>
                                          </button>
                                        </span>
                                      </div>
                                    </div>
                                  </div>
                                  <?php
                                  }else if($tabs['fieldType'] == 'datetime') { ?>
                                    <div class="form-group  <?php if($tabs['isRequired'] == 'yes') echo 'required'; ?>">
                                      <label class="col-sm-3 control-label">Select date-time:</label>
                                      <div class="col-sm-6">
                                        <div class="input-group datetime">
                                          <input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" value="<?php if(isset($tabs['fieldOptions']['option_id'])) echo $tabs['fieldOptions']['option_id']; ?>" class="form-control">
                                          <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                              <i class="fa fa-clock-o"></i>
                                            </button>
                                          </span>
                                        </div>
                                      </div>
                                    </div>
                                  <?php
                                  } ?>
                            </div>
                          <?php $tabCount++; $wkcustom_option_row++; 
                        } 
                      } ?>
              </div>
            </div>
          </div>
        </div>-->
          <?php } ?>
        </div>
        <!--tab-content-->
      </form>
    </div>
    <!--content--> 
    <?php echo $column_right; ?></div>
  <!--row--> 
</div>

<!--container--> 

    <!-- jQuery library -->
    <!-- jQuery Form Validation library -->
    
   
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>

<!-- membership codes starts here --> 
<script type="text/javascript">

$('.selectall').click(function() {
    if ($(this).is(':checked')) {
        $('input:checkbox').prop('checked', true);
    } else {
        $('input:checkbox').prop('checked', false);
    }
});

$('.checkall').click(function() {
    if ($(this).is(':checked')) {
        $('input:checkbox').prop('checked', true);
    } else {
        $('input:checkbox').prop('checked', false);
    }
});

$('#145').click(function() {
	$("#1143").prop('checked', false);
	$("#1143").prop('disabled', 'disabled');	
	$("#58").prop('disabled', 'disabled');
	$("#1142").prop('checked', true);
});
$('#144').click(function() {
		
			$("#1143").prop('disabled', false);
			$("#58").prop('disabled', false);
			$("#1142").prop('checked', false);
		
});

$('.class_submit_approval').val('');	   
    $('.nexttoimg').click(function(){
		 $('#imagelink').click();
		$('html,body').animate({scrollTop:0},0);
    });
	
	 $('#save').click(function(){
	  	$('.class_submit_approval').val(0);
		var save = 	$('.class_submit_approval').val();
		$('.class_status').val(4);
		$('#form-save').submit();
	 
	 });
	
	 $('#submit_approval').click(function(){
		var error = 1;	 
		var error1 = 1;	 
		var error2 = 1;	 
		var error3 = 1;	 
		var error4 = 1;	 
		var error5 = 1;	 
		var error6 = 1;	 
		var error7 = 1;	 
		var error8 = 1;	 
		var error9 = 1;	 
		var error10 = 1;	 
		var error11 = 1;	 
    
		$('.class_submit_approval').val(1);
		$('.class_status').val(2);
		
	 /*for session */
	 	var session = $('#144:checked').val();
		var session1 = $('#145:checked').val();
		
		if(typeof session === 'undefined' && typeof session1 === 'undefined') 
		{
			$('.sess').remove();
			$('.sessiontype').append('<div class="text-danger sess"> This field is required.!</div>');
			$('#142').focus();
			error = 1;
			}else{
				$('.sess').remove();
				error = 0;
				}
		
		/*for cateogry */				
		if($("#product-category").find("div").text()=='')
		{
			$('.cat').remove();
			$('.categoryerror').append('<div class="text-danger cat"> This field is required.!</div>');
			$('#product-category').focus();
			error1 = 1;
			
			
			}else{
				$('.cat').remove();
				error1 = 0;
				}

/*for service name */				
		if($("#input-name1").val()=='')
		{
			$('.service').remove();
			$('.servicename').append('<div class="text-danger service"> This field is required.!</div>');
			//$('#input-name1').focus();
			
			}else{
				$('.service').remove();
				error2 = 0;
				}
	/*for service description. */	
	
	/*$('.note-editable').focusout(function(){
									//var count = $('.note-editable').text().length
					alert(hi);   
									   });*/

	
		if($("#input-description11").val()=='')
		{
			$('.desc').remove();
			$('.service_description').append('<div class="text-danger desc"> This field is required.!</div>');
			//$('#input-description1').focus();
			error3 = 1;
			
			}else{
				$('.desc').remove();
				error3 = 0;
				}
			
	<!--for what's included-->		
		if (!$.trim($("#whats_included_2").val())) {
			$('.include').remove();
			$('.whats_included_2').append('<div class="text-danger include"> This field is required.!</div>');
			//$('#whats_included_2').focus();
			error4 = 1;
			
			}else{
				$('.include').remove();
				error4 = 0;
				}	
				
		
		/*for price */				
		if (!$.trim($("#input-price").val())) {
			$('.pric').remove();
			$('.priceerror').append('<div class="text-danger pric"> This field is required.!</div>');
			//$('#input-price').focus();
			error6 = 1;
			} else if ($.trim($("#input-price").val()) < 10) {
			$('.pric').remove();
			$('.priceerror').append('<div class="text-danger pric">The price must be above or equal to 10SGD</div>');
			error6 = 1;
			} else if ($.trim($("#input-price").val()) > 9999) {
			$('.pric').remove();
			$('.priceerror').append('<div class="text-danger pric">The maximum price allowed is S$9999.</div>');
			error6 = 1;
			} else if($.trim($("#input-discount_value").val())){
				var type = $("input[name='discount_type']:checked").val();
				if(type == 1){
				var input_price = $.trim($("#input-price").val());
				var discount_price = $.trim($("#input-discount_value").val());
				var pervalue = discount_price/100*input_price;
				var final_price = input_price - pervalue;
				} else if(type == 0){
					var input_price = $.trim($("#input-price").val());
					var discount_price = $.trim($("#input-discount_value").val());
					var final_price = input_price - discount_price;
				}
				if (final_price < 10) {
					$('.pric').remove();
					$('.priceerror').append('<div class="text-danger pric">The minimum price is SGD10.</div>');
					error6 = 1;
				}else{
				$('.pric').remove();
				error6 = 0;
				}
			}else{
				$('.pric').remove();
				error6 = 0;
				}
				
		/*for location type */
	 	var locationt = $('#58:checked').val();
		var locationt1 = $('#59:checked').val();
		
		if(typeof locationt === 'undefined' && typeof locationt1 === 'undefined') 
		{
			$('.loc').remove();
			$('.location').append('<div class="text-danger loc"> This field is required.!</div>');
			//$('#58').focus();
			error7 = 1;
			}else{
				$('.loc').remove();
				error7 = 0;
				}	
		/*for maximum allowed */
	 	if (!$.trim($("#maxallowed").val())) {
			$('.maxal').remove();
			$('.maxallerror').append('<div class="text-danger maxal"> This field is required.!</div>');
			//$('#maxallowed').focus();
			error8 = 0;
			
			}else{
				$('.maxal').remove();
				error8 = 0;
				}	
				
		/*for service type */
	 	var service = $('#1142:checked').val();
		var service1 = $('#1143:checked').val();

		if(typeof service === 'undefined' && typeof service1 === 'undefined') 
		{
			$('.serv').remove();
			$('.servicetypeerror').append('<div class="text-danger serv"> This field is required.!</div>');
			//$('#1144').focus();
			error9 = 1;
			}else{
				
				$('.serv').remove();
				error9 = 0;
				}	
				
	/*for image */
	if (!$.trim($("#image-target-image").val())) {
			$('.imger').remove();
			$('.imagecheck').after('<div class="text-danger imger"> This field is required.!</div>');
			//$('#image-target-image').focus();
			error10 = 1;
			
			}else{
				
				$('.imger').remove();
				error10 = 0;
				}	
				
		<!--form submit-->
	
		if(error==0 && error1==0 && error2==0 && error3==0 && error4==0 && error6==0 && error7==0 && error9==0 && error10==0){
		console.log('correct..');
		
		<?php if($product_info1['status'] == 1){ ?>
		if (confirm("You are about to modify an active listing. Existing bookings won't be affected by the changes. Customers won't be able to book this service until your service is activated by Zowedo Partner Support team. Please confirm?") ) {
    	console.log('okay');
		$('#form-save').submit();
		} else {
			console.log('cancel');
			//code here for don't leave (Cancel)
		}
		<?php } else{ ?>
		
			$('#form-save').submit();
			<?php } ?>
			}else{
				$('#alert-danger').remove();
				$('.breadcrumb').after('<div class="alert alert-danger" id="alert-danger"><i class="fa fa-exclamation-circle"></i> Warning: Please check the page carefully for missing information!</div>');
				}

		
		
	 // 
    });


$('#tab-dailydeal').hide();
 $("a[href$='#tab-dailydeal']").hide();
$("input[name='dealquantity']").val(100);

 
$("select[name='dealstatus']").each(function () {
		$("select[name='dealstatus']").removeAttr('selected');	
		var new_selection = $(this).find('option:selected');
new_selection.attr("selected",true).removeAttr('selected');	

$("select[name='dealstatus'] option[value=1]").attr('selected','selected');

        
});


$("#input-name1").focusout(function(){
      $('#input-meta-description1').val('');
	   $('#input-meta-description1').val($(this).val());
    });

 <?php if($update_dive!=1) { ?>
$('.zonearray').hide();
$('.locationaddress').hide();
$('#serviceduration').val(60);	
 $('#input-meta-description1').val('');
<?php } else {?>

$('.zonearray').hide();
$('.locationaddress').hide();
<?php }?>

var type1 = $("input[name='product_custom_field[5][custom_field_value][]']:checked").val();
if(type1==8)
{
	$('.zonearray').show();
	$('.locationaddress').hide();
	}else if(type1==9)
	{
		$('.zonearray').hide();
		$('.locationaddress').show();
		
		}
							
            
$('#selecthours').change(function() {
	
	$('#serviceduration').val('');
	var hours_minutes = parseInt($(this).val());
	var minutes = parseInt($('#selectminutes').val());
	var hours = $('#serviceduration').val(minutes+hours_minutes);
	
	
});
$('#selectminutes').change(function() {
$('#serviceduration').val('');

	var hours_minutes = parseInt($('#selecthours').val());
	var minutes = parseInt($(this).val());
	var hours = $('#serviceduration').val(minutes+hours_minutes);
	
});


var type = $("input[name='discount_type']:checked").val();
var commission = <?php echo $commission;?>;
 var price = $("#input-price").val();
	   

	 if(price!='')
{
	var main_price = $('#input-price').val();
	var discount_value = 0;
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	
	$totalrows = count($customer_groups);
    for($i=0;$i<$totalrows;$i++)
    {
	?>
	 
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
}
if(type!='')
{
if(type==1)
{
	
	 $('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	
	<?php 
	
	$totalrows = count($customer_groups);
    for($i=0;$i<$totalrows;$i++)
    {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	 
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
	
	}else if(type==0)
	{
		$('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	 
		<?php 
	 $totalrows = count($customer_groups);
	
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var dealPrice = main_price-discount_value;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+discount_value);
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
	
	
		
		}
		
}

$("#input-discount_value,#input-price").focusout(function(){
     var type = $("input[name='discount_type']:checked").val();
	 var price = $("#input-price").val();
if(price!='')
{
	var main_price = $('#input-price').val();
	var discount_value = 0;
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	 
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
}
if(type!='')
{
if(type==1)
{
	
	 $('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	 
	<?php 
	
	$totalrows = count($customer_groups);
    for($i=0;$i<$totalrows;$i++)
    {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	 
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
	
	}else if(type==0)
	{
		$('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	 
		<?php 
	 $totalrows = count($customer_groups);
	
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var dealPrice = main_price-discount_value;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+discount_value);
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
	
	
		
		}
		
}
    });


$("#input-discount_value,#input-price").mouseover(function(){
     var type = $("input[name='discount_type']:checked").val();
	 var price = $("#input-price").val();
	   

	 if(price!='')
{
	var main_price = $('#input-price').val();
	var discount_value = 0;
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	 
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
}
if(type!='')
{
if(type==1)
{
	
	 $('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	 
	<?php 
	
	$totalrows = count($customer_groups);
    for($i=0;$i<$totalrows;$i++)
    {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	 
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
	
	}else if(type==0)
	{
		$('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	 
		<?php 
	 $totalrows = count($customer_groups);
	
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var dealPrice = main_price-discount_value;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+discount_value);
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
	
	
		
		}
		
}
    });


$(".discount_type").click(function () 
{
var type = $(this).val();
 var price = $("#input-price").val();
	   

	 if(price!='')
{
	var main_price = $('#input-price').val();
	var discount_value = 0;
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	 
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
}
if(type==1)
{
	//alert('test');
	$('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	 
	<?php 
	 $totalrows = count($customer_groups);
	 for($i=0;$i<$totalrows;$i++)
     {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var pervalue = discount_value/100*main_price;
	var dealPrice = main_price-pervalue;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+pervalue.toFixed(2));
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
	
	}else if(type==0)
	{
	$('.pricetbale_price').html('');
	 $('.pricetbale_discountvalue').html('');
	 $('.pricetbale_servicefee').html('');
	 $('.pricetbale_takehomefee').html('');
	 
	<?php 
	 $totalrows = count($customer_groups);
	
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val('');
	
	<?php }?>
	var main_price = $('#input-price').val();
	var discount_value = $('#input-discount_value').val();
	var dealPrice = main_price-discount_value;
	var homefeed  = dealPrice-((commission/100) * dealPrice);
	var plfee = (commission/100) * dealPrice;
	if(main_price!='')
	{
	$('.pricetbale_price').html('S$'+main_price);
	 $('.pricetbale_discountvalue').html('S$'+discount_value);
	 $('.pricetbale_servicefee').html('S$'+plfee.toFixed(2)+'('+commission+'%)');
	 $('.pricetbale_takehomefee').html('S$'+homefeed.toFixed(2));
	}
	<?php 
	 $totalrows = count($customer_groups);
               for($i=0;$i<$totalrows;$i++)
               {
	?>
	$("input[name='product_special[<?php echo $i;?>][price]']").val(dealPrice);
	
	<?php }?>
		
		}
});


$(".servicetype").click(function () 
{
var type = $(this).val();
if(type==8)
{
	$('.zonearray').show();
	$('.locationaddress').hide();
	$('.selectall').click();
	}else if(type==9)
	{
		$('.zonearray').hide();
		$('.locationaddress').show();
		
		}
});
<?php if(isset($wk_seller_group_status) && $wk_seller_group_status) { ?>
  listing_duration = 0;
  <?php if(isset($relist_duration) && $relist_duration) { ?>
    listing_duration = <?php echo $relist_duration; ?>;
  <?php } ?>
  var count = 0;
    function getListingDuration(gld_category_id) {
      $.ajax({
        url: 'index.php?route=account/customerpartner/wk_membership_catalog/getListingDuration',
        data: {category_id: gld_category_id},
        type: 'post',
        methodType: 'json',
        success: function(data) {
          console.log(data);
          $('#alert-danger').remove();
          $('#alert-info').remove();
          html = '';
          if(data) {
            for (var i = 1; i <= data; i++) {
              html += '<option value="'+i+'"';
              if(listing_duration == i) {
                html += ' selected ';
              }
              html += '>'+i+' day(s)</option>';
            };
            $('#input-relist-duration').html(html);
            if(count != 0) {
              $('.breadcrumb').after('<div class="alert alert-info" id="alert-info"><i class="fa fa-info-circle"></i> Listing duration has been refreshed as per category selection, please check it again.<button class="close" data-dismiss="alert" type="button">×</button></div>');
            } else {
              count++;
            }
          } else {
            html += '<option></option>';
            $('#input-relist-duration').html(html);
            $('.breadcrumb').after('<div class="alert alert-danger" id="alert-danger"><i class="fa fa-exclamation-circle"></i> Warning: No more listing duration is available!</div>');
            $('body').animate({
              scrollTop: 0,
            },'slow');
          }
        }
      });
    }
    getListingDuration(0);
<?php } ?>
</script> 
<!-- membership codes ends here --> 

<script type="text/javascript">

/*var form = document.getElementById('form-save');
form.elements.product_description[1][name].onblur = function () {
    var form = this.form;
    form.elements.product_description[1][name].value = form.elements.product_description[1][meta_title].value;
};*/

  $('#vtab-option a:first').tab('show');
    tabCount = '<?php echo $tabCount; ?>';
    wkcustom_option_row = '<?php echo $wkcustom_option_row; ?>';
    $('select[name="wkcustomfield"]').on('change',function(){
      value = $(this).val();
      if(value == ''){
        return;
      }

      if($('body').find('[field-id = wkoption-'+value+']').length){
        return;
      }
    fieldType = $('option:selected', this).attr('data-type');
    fieldName = $('option:selected', this).attr('data-name');
    fieldDes = $('option:selected', this).attr('data-des');
    fieldIsRequired = $('option:selected', this).attr('data-isRequired');
    tab = '<li><a href="#wktab-option-'+tabCount+'" data-toggle="tab" id="wkoption-'+tabCount+'" field-id = "wkoption-'+value+'"><i class="fa fa-minus-circle" onclick="$(\'#wkoption-' + tabCount + '\').remove(); $(\'#wktab-option-' + tabCount + '\').remove(); $(\'#vtab-option a:first\').trigger(\'click\'); return false;" /></i>&nbsp;'+fieldName+'</a></li>';
    $('#optionSelector').before(tab);
    html  = '';
    html += '<input type="hidden" name="product_custom_field['+wkcustom_option_row+'][custom_field_name]" value="'+fieldName+'">';
    html += '<input type="hidden" name="product_custom_field['+wkcustom_option_row+'][custom_field_type]" value="'+fieldType+'">';
    html += '<input type="hidden" name="product_custom_field['+wkcustom_option_row+'][custom_field_id]" value="'+value+'">';
    html += '<input type="hidden" name="product_custom_field['+wkcustom_option_row+'][custom_field_des]" value="'+fieldDes+'">';
    html += '<input type="hidden" name="product_custom_field['+wkcustom_option_row+'][custom_field_is_required]" value="'+fieldIsRequired+'">';
    if(fieldIsRequired == 'yes'){
      required = 'required';
    }else{
      required = '';
    }
    if(fieldType == "textarea"){

      html += '<div class="form-group '+required+' "><label class="col-sm-3 control-label"><?php echo $entry_enter_text; ?></label>';
      html += '<div class="col-sm-9"><textarea class="form-control" id="" value="" name="product_custom_field['+wkcustom_option_row+'][custom_field_value][]" row="7"></textarea></div></div>';
      addtoBody(html);

    }else if(fieldType == "text"){
      
      html += '<div class="form-group '+required+'"><label class="col-sm-3 control-label"><?php echo $entry_enter_text; ?></label>';
      html += '<div class="col-sm-9"><input type="text" class="form-control" name="product_custom_field['+wkcustom_option_row+'][custom_field_value][]" /></div></div>';
      addtoBody(html);

    }else if(fieldType == "time"){
      
      html += '<div class="form-group '+required+'"><label class="col-sm-3 control-label"><?php echo $entry_select_time; ?></label>';
      html += '<div class="col-sm-6"><div class="input-group time"><input type="text" name="product_custom_field['+wkcustom_option_row+'][custom_field_value][]" class="form-control" /><span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button</span></div</div></div>';

      addtoBody(html);   

    }else if(fieldType == "datetime"){

      html += '<div class="form-group '+required+'"><label class="col-sm-3 control-label"><?php echo $entry_select_datetime; ?></label>';
      html += '<div class="col-sm-6"><div class="input-group datetime"><input type="text" name="product_custom_field['+wkcustom_option_row+'][custom_field_value][]" class="form-control" /><span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button</span></div</div></div>';
      
      addtoBody(html);  

    }else if(fieldType == "date"){

      html += '<div class="form-group '+required+'">';
      html += '<label class="col-sm-3 control-label"><?php echo $entry_select_date; ?></label>';
      html += '<div class="col-sm-6"><div class="input-group date">';
      html += '<input type="text" name="product_custom_field[<?php echo $wkcustom_option_row; ?>][custom_field_value][]" class="form-control">';
      html += '<span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div></div>';

      addtoBody(html); 
      
    }else{
      $.ajax({        
        url:'index.php?route=account/customerpartner/addproduct/getOptions',
        data:'&value='+value,
        dataType:'json',
        type:'post',
        success:function(data){
          innerHtml = '';
          if(fieldType == "select"){
            html += '<div class="form-group '+required+'"><label class="col-sm-3 control-label">Options</label><div class="col-sm-9" >';
          }else{
            html += '<div class="form-group '+required+'"><label class="control-label">Options</label><div>';
          }
          $.each(data, function(key,val){
            if(fieldType == "select"){
              innerHtml += '<option value="' + val.optionId +'">' + val.optionValue + '</option>'
            }else if(fieldType == "checkbox"){
            
              html += '<div class="radio checkbox"><label for="'+ wkcustom_option_row + val.optionId +'"><input type='+fieldType+' id="'+ wkcustom_option_row + val.optionId +'" value="'+val.optionId+'" name="product_custom_field['+wkcustom_option_row+'][custom_field_value][]">'+val.optionValue+'</lable></div>';
             
            }else{
              
              html += '<div class="radio checkbox"><label for="'+ wkcustom_option_row + val.optionId +'"><input type='+fieldType+' id="'+ wkcustom_option_row + val.optionId +'" value="'+val.optionId+'" value="'+val.optionId+'" name="product_custom_field['+wkcustom_option_row+'][custom_field_value][]">'+val.optionValue+'</lable></div>';

            }
          });
          if(fieldType == "select") {
            html += '<select class="form-control" name="product_custom_field['+wkcustom_option_row+'][custom_field_value][]">'+innerHtml+'</select>';
          }
          addtoBody(html);
        }
      })
    }
  });

  function addtoBody(html){
    html = '<div id="wktab-option-'+tabCount+'" class="tab-pane"><div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + fieldDes + '</div>' + html + '</div></div></div>';
    $('#wk_customfieldcontent').append(html);
    $('#wkoption-' + tabCount).trigger('click');
    tabCount++;
    wkcustom_option_row++;

    $('.date').datetimepicker({
      pickTime: false
    });

    $('.time').datetimepicker({
      pickDate: false
    });

    $('.datetime').datetimepicker({
      pickDate: true,
      pickTime: true
    });
  }
  $('.date').datetimepicker({
    pickTime: false
  });

  $('.time').datetimepicker({
    pickDate: false
  });

  $('.datetime').datetimepicker({
    pickDate: true,
    pickTime: true
  });
</script> 
<!-- script end here --> 
<script src="catalog/view/javascript/wk_common.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
  $('#input-description<?php echo $language['language_id']; ?>').summernote({
    height: 300,
  });
<?php } ?>

$('.data-date').datetimepicker({
    pickTime: false
});

$('.tab-content').on('click','.click-file',function(){
  $(this).prev().trigger('click');  
})

$(function() {
   $("body").on("change","input[type='file']", function() {
    $.this = this;
       var files = !!this.files ? this.files : [];
       if (!files.length || !window.FileReader) return; /* no file selected, or no FileReader support */
       if ('<?php echo IMAGE_PATH ;?>/.test( files[0].type)') { /* only image file */
           var reader = new FileReader(); /* instance of the FileReader */
           reader.readAsDataURL(files[0]); /* read the local file */

           reader.onloadend = function() { /* set image to display only */
               src = this.result;
               $($.this).next().attr('src',src);
           }
       }
   });
});

//--></script>
<?php if(isset($mp_allowproducttabs['links']) && $mp_allowproducttabs['links']) { ?>
<script type="text/javascript"><!--
$('input[name=\'manufacturer\']').click(function() {
  $(this).autocomplete("search");
});
// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
  minLength: 0,
  delay: 101,    
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/manufacturer&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) { 
        json.unshift({    
          manufacturer_id: 0,   
          name: '<?php echo $text_none; ?>'   
        }); 
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['manufacturer_id']
          }
        }));
      }
    });
  }, 
  select: function(item) {
    $('input[name=\'manufacturer\']').val(item['label']);
    $('input[name=\'manufacturer_id\']').val(item['value']);
  
    return false;
  },
  focus: function(item) {
      return false;
   }
});


$('input[name=\'category\']').click(function(){
  $(this).autocomplete("search");
});

// Category
$('input[name=\'category\']').autocomplete({
  minLength: 0,
  delay: 101,  
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/category&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {   
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['category_id']
          }
        }));
      }
    });
  }, 
  select: function(item) {
  // <!-- membership codes starts here -->
     <?php if($wk_seller_group_status && isset($wk_seller_group_single_category) && $wk_seller_group_single_category) { ?>
       $('input[name=\'category\']').val('');
    $('#product-category' + item['value']).remove();
    
    $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');  

    $('#product-category div:odd').attr('class', 'odd');
    $('#product-category div:even').attr('class', 'even');
      <?php if($wk_seller_group_status) { ?>
        getListingDuration(item['value']);
      <?php } ?>
    <?php } else { ?>
    $('input[name=\'category\']').val('');
    $('#product-category' + item['value']).remove();
    
    $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');  

    $('#product-category div:odd').attr('class', 'odd');
    $('#product-category div:even').attr('class', 'even');
    <?php } ?>
     //<!-- membership codes ends here -->
        
    return false;
  },
  focus: function(item) {
      return false;
   }
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {  
  $(this).parent().remove();  
  $('#product-category div:odd').attr('class', 'odd');
  $('#product-category div:even').attr('class', 'even');  
});


$('input[name=\'filter\']').click(function(){
  $(this).autocomplete("search");
});

// Filter
$('input[name=\'filter\']').autocomplete({
  minLength: 0,
  delay: 101,   
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/filter&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {   
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['filter_id']
          }
        }));
      }
    });
  }, 
  select: function(item) {
    $('input[name=\'filter\']').val('');
    $('#product-filter' + item['value']).remove();
    
    $('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');

    $('#product-filter div:odd').attr('class', 'odd');
    $('#product-filter div:even').attr('class', 'even');
        
    return false;
  },
  focus: function(item) {
      return false;
   }
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {  
  $(this).parent().remove();  
  $('#product-filter div:odd').attr('class', 'odd');
  $('#product-filter div:even').attr('class', 'even');  
});

$('input[name=\'download\']').click(function(){
  $(this).autocomplete("search");
});

// Downloads
$('input[name=\'download\']').autocomplete({
  minLength: 0,
  delay: 101,    
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/download&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) { 
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['download_id']
          }
        }));
      }
    });
  }, 
  select: function(item) {
    $('input[name=\'download\']').val('');
    $('#product-download' + item['value']).remove();
    
    $('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');

    $('#product-download div:odd').attr('class', 'odd');
    $('#product-download div:even').attr('class', 'even');
        
    return false;
  },
  focus: function(item) {
      return false;
   }
});

$('#product-download').delegate('.fa-minus-circle', 'click', function() {  
  $(this).parent().remove();  
  $('#product-download div:odd').attr('class', 'odd');
  $('#product-download div:even').attr('class', 'even');  
}); 

$('input[name=\'related\']').click(function(){
  $(this).autocomplete("search");
});
// Related
$('input[name=\'related\']').autocomplete({
  minLength: 0,
  delay: 101,  
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/product&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {   
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['product_id']
          }
        }));
      }
    });
  }, 
  select: function(item) {
    $('input[name=\'related\']').val('');
    $('#product-related' + item['value']).remove();
    
    $('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');

    $('#product-related div:odd').attr('class', 'odd');
    $('#product-related div:even').attr('class', 'even');
        
    return false;
  },
  focus: function(item) {
      return false;
   }
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() { 
  $(this).parent().remove();  
  $('#product-related div:odd').attr('class', 'odd');
  $('#product-related div:even').attr('class', 'even'); 
});
//--></script>
<?php } ?>
<?php if(isset($mp_allowproducttabs['attribute']) && $mp_allowproducttabs['attribute']) { ?>
<script type="text/javascript"><!--

var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
  html  = '<tbody id="attribute-row' + attribute_row + '">';
    html += '  <tr>';
  html += '    <td class="text-left"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
  html += '    <td class="text-left">';
  <?php foreach ($languages as $language) { ?>
  html += '<div class="input-group"><span class="input-group-addon"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div> ';
    <?php } ?>
  html += '    </td>';
  html += '    <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '  </tr>';  
    html += '</tbody>';
  
  $('#attribute tfoot').before(html);
  
  attributeautocomplete(attribute_row);
  
  $('input[name=\'product_attribute[' + attribute_row + '][name]\']').click(function(){
      $(this).autocomplete("search");
  });

  attribute_row++;
}

function attributeautocomplete(attribute_row) {
  $('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
    minLength: 0,
    delay: 101,  
    source: function(request, response) {
      $.ajax({
        url: 'index.php?route=customerpartner/autocomplete/attribute&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) { 
          response($.map(json, function(item) {
            return {
              category: item.attribute_group,
              label: item.name,
              value: item.attribute_id
            }
          }));
        }
      });
    }, 
    select: function(item) {
      $('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
      $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
      
      return false;
    },
    focus: function(item) {
          return false;
      }
  });
}

$('#attribute tbody').each(function(index, element) {
  attributeautocomplete(index);
});
 //--></script>
<?php } ?>
<?php if(isset($mp_allowproducttabs['options']) && $mp_allowproducttabs['options']) { ?>
<script type="text/javascript"><!-- 

var option_row = <?php echo $option_row; ?>;

$('input[name=\'option\']').autocomplete({
  minLength: 0,
  delay: 101,  
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/option&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            category: item.category,
            label: item.name,
            value: item.option_id,
            type: item.type,
            option_value: item.option_value
          }
        }));
      }
    });
  }, 
  select: function(item) {    
    html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
    html += ' <input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
    html += ' <input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
    html += ' <input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
    html += ' <input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

    html += ' <div class="form-group">';
    html += '   <label class="col-sm-3 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
    html += '   <div class="col-sm-9"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
    html += '       <option value="1"><?php echo $text_yes; ?></option>';
    html += '       <option value="0"><?php echo $text_no; ?></option>';
    html += '   </select></div>';
    html += ' </div>';

    if (item['type'] == 'text') {
      html += ' <div class="form-group">';
      html += '   <label class="col-sm-3 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
      html += '   <div class="col-sm-9"><input type="text" name="product_option[' + option_row + '][option_value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
      html += ' </div>';
    }
    
    if (item['type'] == 'textarea') {
      html += ' <div class="form-group">';
      html += '   <label class="col-sm-3 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
      html += '   <div class="col-sm-9"><textarea name="product_option[' + option_row + '][option_value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
      html += ' </div>';      
    }
     
    if (item['type'] == 'file') {
      html += ' <div class="form-group" style="display: none;">';
      html += '   <label class="col-sm-3 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
      html += '   <div class="col-sm-9"><input type="text" name="product_option[' + option_row + '][option_value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
      html += ' </div>';
    }

    if (item['type'] == 'date') {
      html += ' <div class="form-group">';
      html += '   <label class="col-sm-3 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
      html += '   <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][option_value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
      html += ' </div>';
    }
    
    if (item['type'] == 'time') {
      html += ' <div class="form-group">';
      html += '   <label class="col-sm-3 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
      html += '   <div class="col-sm-9"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][option_value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
      html += ' </div>';
    }
        
    if (item['type'] == 'datetime') {
      html += ' <div class="form-group">';
      html += '   <label class="col-sm-3 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
      html += '   <div class="col-sm-9"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][option_value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
      html += ' </div>';
    }
    
    if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
      html += '<div class="table-responsive">';
      html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
      html += '    <thead>'; 
      html += '      <tr>';
      html += '        <td class="text-left"><?php echo $entry_option_value; ?></td>';
      html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
      html += '        <td class="text-left"><?php echo $entry_subtract; ?></td>';
      html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
      html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
      html += '        <td class="text-right"><?php echo $entry_weight; ?></td>';
      html += '        <td></td>';
      html += '      </tr>';
      html += '    </thead>';
      html += '    <tbody>';
      html += '    </tbody>';
      html += '    <tfoot>';
      html += '      <tr>';
      html += '        <td colspan="6"></td>';
      html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_add_option_value; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
      html += '      </tr>';
      html += '    </tfoot>';
      html += '  </table>';
      html += '</div>';

        html += '  <select id="option-values' + option_row + '" style="display: none;">';
      
            for (i = 0; i < item['option_value'].length; i++) {
        html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
            }

            html += '  </select>';  
      html += '</div>';   
    }   
    
    $('#tab-option .tab-content').append(html);
      
    $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove(); $(\'#option a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');
    
    $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');
    
    $('.date').datetimepicker({
      pickTime: false
    });
    
    $('.time').datetimepicker({
      pickDate: false
    });
    
    $('.datetime').datetimepicker({
      pickDate: true,
      pickTime: true
    });
        
    option_row++;
    
    return false;
  },
  focus: function(item) {
      return false;
   }
});
//--></script> 
<script type="text/javascript"><!--   
var option_value_row = <?php echo $option_value_row; ?>;
console.log(option_value_row);

function addOptionValue(option_row) { 
  html  = '<tbody id="option-value-row' + option_value_row + '">';
  html += '<tr>';
  html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
  html += $('#option-values' + option_row).html();
  html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
  html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>'; 
  html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
  html += '    <option value="1"><?php echo $text_yes; ?></option>';
  html += '    <option value="0"><?php echo $text_no; ?></option>';
  html += '  </select></td>';
  html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
  html += '    <option value="+">+</option>';
  html += '    <option value="-">-</option>';
  html += '  </select>';
  html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
  html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
  html += '    <option value="+">+</option>';
  html += '    <option value="-">-</option>';
  html += '  </select>';
  html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';  
  html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
  html += '    <option value="+">+</option>';
  html += '    <option value="-">-</option>';
  html += '  </select>';
  html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
  html += '  <td class="text-left"><button type="button" onclick="$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';
  html +='</tbody>;';
  
  $('#option-value' + option_row + ' tfoot').before(html);

  option_value_row++;
}
//--></script>
<?php } ?>
<?php if(isset($mp_allowproducttabs['discount']) && $mp_allowproducttabs['discount']) { ?>
<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
  html = '<tbody id="discount-row' + discount_row + '">';
  html  += '<tr>'; 
  html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';   
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
  html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
  html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
  html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
  html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';
  html += '</tbody>';
  
   $('#discount tfoot').before(html);

  $('.date').datetimepicker({
    pickTime: false
  });
  
  discount_row++;
}
//--></script>
<?php } ?>

<?php if(isset($mp_allowproducttabs['special']) && $mp_allowproducttabs['special']) { ?>
<script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
  html = '<tbody id="special-row' + special_row + '">'
  html  += '<tr>'; 
    html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';   
    html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
  html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
  html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
  html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';
  html += '</tbody>';
  
 $('#special tfoot').before(html);

  $('.date').datetimepicker({
    pickTime: false
  });
    
  special_row++;
}
//--></script>
<?php } ?>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
if(image_row==5)
{
	$('.imageerror').show();
	}else{
  html  = '<tbody id="image-row' + image_row + '">';
  html += '  <tr>';
  html += '  <td class="text-left RemoveImgB"><div style="width:110px;height:100px;overflow:hidden" class="img-thumbnail wk_upload_img"><img id="thumb' + image_row + '-thumb-image" src="<?php echo $placeholder; ?>" alt="" title=""/></div><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="thumb' + image_row + '-target-image"/><div class="btn-group imgoption" style="width: 41%; display:none;"><button class="LisImgButbtn btn-danger btn-sm delete_img" type="button">Remove</button></div>';
  //html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>'; 
   html += '<button class="ARemvB" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"><i class="fa fa-trash" aria-hidden="true" style="font-size: 20px;color: #f69a00;"></i></button><i style="font-size: 20px;margin-left: 5px;color: #f69a00;display:none;" class="open-crop fa fa-crop" onclick="openCrop($(\'#thumb' + image_row + '-target-image\').val(), \'thumb' + image_row + '-thumb-image\');"></i></td>';
  //html += '<button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="LisImgBut">Remove</button></td>';
  html += '</tr>';
  html += '</tbody>';

  $('#images tfoot').before(html);
  
  image_row++;
  }
}
//--></script> 

<script>
$( document ).ready(function() {
    console.log( "ready!" );
	$("[id*=postal_code]").on('keydown', function(e) { 
  var keyCode = e.keyCode || e.which; 
  if (keyCode == 9 || keyCode == 13) {
     e.preventDefault();
    
		$('#address').val('');							  
		var postcode = $('#postal_code').val();
		if(postcode !=='')
		{
			$.ajax({                    
  url: 'index.php?route=account/customerpartner/personal_info1/getaddress',     
  type: 'post', // performing a POST request
  data : {Postalcode: postcode},                
  success: function(data)         
  {
	  if(data!=='')
	  {
		 var result =  data.split("|");
		 console.log(result);
		 console.log(result[0]);
		$('#address').val(result[0]);
		$('#building_name').val(result[1]);
		
		$('#floor').focus();
		 
	  }else{
		  alert('Unauthorized postcode.');
		  $('#postal_code').focus();
		 
		  }
  } 
});
		}else{
			alert('Please put postal code');
		
			}
			
	
	
 }
 });
	
	$(".GetAddT").on("click",function(){ 
		$('#address').val('');							  
		var postcode = $('#postal_code').val();
		alert('postcode');
		if(postcode !=='')
		{
			$.ajax({                    
  url: 'index.php?route=account/customerpartner/personal_info1/getaddress',     
  type: 'post', // performing a POST request
  data : {Postalcode: postcode},                
  success: function(data)         
  {
	  if(data!=='')
	  {
		var result =  data.split("|");
		 console.log(result);
		 console.log(result[0]);
		$('#address').val(result[0]);
		$('#building_name').val(result[1]);
		
		$('#floor').focus();
	  }else{
		  alert('Unauthorized postcode.');
		  $('#postal_code').focus();
		  }
  } 
});
		}else{
			
			alert('Please put postal code');
			}
			
      //$.post( "index.php?route=account/customerpartner/personal_info1/getaddress", { Postalcode: "408600"} );
    });
	$("#addAddress").on("click",function(){ 

	var postal_code = $('#postal_code').val();
	var address = $('#address').val();
	var floorno = $('#floor').val();
	var building = $('#building_name').val();
	if(postal_code!='' && address!='' && floorno!='' )
	{
		$.ajax({                    
		  url: 'index.php?route=account/customerpartner/addproduct/addAddress',     
		  type: 'post', // performing a POST request
		  data : {postal_code: postal_code,address:address,floor:floorno,building_name:building},                
		  success: function(data)         
		  {
			  $('#locationadd').empty();
			  $('#locationadd').append(data);
			  $('#exampleModal').modal('hide');
			 console.log(data);
		  } 
});
		}
		else{
			alert('Please enter all fields.')
			
			}
	
	
	
			
    });
});

 
</script>

<script>
$(".locationaddress1").on("change",function(){ 

			var locat   = document.getElementById("locationadd").value;
			
			$('#location1').val(locat);
         });
/*$('textarea').keyup(updateCount);
$('textarea').keydown(updateCount);

function updateCount() {
    var cs = $(this).val().length;
    $('#characters').text(cs);
}*/
</script> 

<script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script>
</div>
<?php }else{ ?>
<?php echo $text_access; ?>
</div>
<!--content--> 
<?php echo $column_right; ?>
</div>
<!--row-->
</div>
<!--container-->
<?php } ?>
<?php } ?>
<!-- membership codes starts here -->
<?php if($wk_seller_group_status && $wk_seller_group_membership_type && $wk_seller_group_membership_type != 'product') {  ?>
<div id="myModalanswer" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"></h3>
      </div>
      <div class="modal-body"> <span id="alert" class="text-danger"></span>
        <h3 id="wk-open-list"><?php echo $entry_list_header; ?></h3>
        <table class="table table-bordered table-hover" id="details">
          <thead>
            <tr>
              <td><?php echo $entry_name; ?></td>
              <td><?php echo $entry_quantity; ?></td>
              <td><?php echo $entry_price; ?></td>
            <tr>
          </thead>
          <tbody>
            <?php foreach($sellerDetail as $detail){ ?>
            <tr>
              <td><?php echo $detail['name']; ?></td>
              <td><?php echo $detail['quantity']; ?></td>
              <td><?php echo $detail['price']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button class="btn closebtn" data-dismiss="modal" aria-hidden="true" id="closeButton">Close</button>
      </div>
    </div>
  </div>
</div>
<?php } ?>
<!-- membership codes ends here --> 
<?php echo $footer; ?> 
<script type="text/javascript">
  function openCrop(image, element = '', first = false) {
    $('#modal-imageeditor').remove();
    if (first) {
      first = 1;
    } else {
      first = 0;
    }
    $.ajax({
        url : 'index.php?route=common/imageeditor&name=' + image + '&element=' + element + '&first=' + first,
        dataType: 'html',
        success: function(html) {
          $('body').append('<div class="modal fade" id="modal-imageeditor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' + html + '</div>');

          $('#modal-imageeditor').modal('show');
        }
      });
  }
</script>

