<?php if (!isset($redirect)) { ?>

<div class="cart-info-wrapper">
  <div class="cart-info confirm" style="font-size:12px !important;">
    <?php  if($isOrderAllowed==1) { ?>
    <div class="cart_bottom_line">
      <div class="payment">
        <div class="buttons">
          <div class="right"> <a href="index.php?route=common/home" class="button">Continue Shopping</a> </div>
        </div>
      </div>
    </div>
    <?php } else { ?>
      <?php if($IsDisplayMessage==1){ ?>
    <div class="cart_bottom_line_1">Hello, you are about to Check Out! You may have to bear a Rs.100 Handling Charge & SAC as your Order is under Rs.1500. Would you like to add a few more items to your Cart?<br />
      <br />
      If Yes, please click on the CONTINUE SHOPPING button below, <br />
      If No, please click on the CONFIRM ORDER button</div>
      <?php } ?>
    <div style="overflow-x:auto;">
      <table class="table">
        <thead>
          <tr>
            <td align="center"><?php echo S.NO; ?></td>
            <td align="left"><?php echo $column_name; ?></td>
            <td align="center"><?php echo $column_model; ?></td>
            <td align="center"><?php echo "HSN Code"; ?></td>
             <?php if($discount_flag==1) { ?>
            <td align="center">Item Price</td>
             <td align="center">Discount%</td>
              <?php } ?>
            <td align="center"><?php echo "Unit Rate"; ?></td>
            <td align="center"><?php echo "Qty"; ?></td>
            <td align="center"><?php echo "Unit Total"; ?></td>
            <?php if(!empty($isGSTAllowed)): ?>
            <td colspan="2" align="center"><?php echo "CGST <br /><span style='float: left; font-size:11px;'>Rate(%)</span><span style='float: right; font-size:11px;'>Amt(&#8377)</span>"; ?></td>
            <td colspan="2" align="center"><?php echo "SGST <br /><span style='float: left; font-size:11px;'>Rate(%)</span><span style='float: right; font-size:11px;'>Amt(&#8377)</span>"; ?></td>
            <td colspan="2" align="center"><?php echo "IGST <br /><span style='float: left; font-size:11px;'>Rate(%)</span><span style='float: right; font-size:11px;'>Amt(&#8377)</span>"; ?></td>
            <td align="center"><?php echo $column_total; ?></td>
            <?php endif; ?>
          </tr>
        </thead>
        <tbody>
          <?php $unitPriceTotal = $cgstTotal = $sgstTotal = $igsttTotal = $totalPrice = $countFlag = $unitTotal = 0; ?>
          <?php foreach ($products as $product) { ?>
          <?php if($product['recurring']): ?>
          <tr>
            <td colspan="6" style="border:none;"><image src="catalog/view/theme/default/image/reorder.png" alt="" title="" style="float:left;" />
              <span style="float:left;line-height:18px; margin-left:10px;" > <strong><?php echo $text_recurring_item ?></strong> </span><?php echo $product['profile_description'] ?></td>
          </tr>
          <?php endif; ?>
          <?php if($product['is_sample_sale']==1) { ?>
          <tr>
            <td align="center"><?php echo ++$countFlag; ?></td>
            <td align="left"> <?php echo $product['name']; ?> <span style="color:#a7257d;font-weight:bold;">(Free) </span> </td>
            <td align="center"><?php echo $product['model']; ?></td>
            <td align="center"><?php echo $product['isbn']; ?></td>
            <?php if($discount_flag==1) { ?>
             <td align="center"><?php echo number_format($product['before_discount_price'],2); ?></td>
             <!--<td align="center">-<?php  if($product['parent_category_id']=='18') { echo $product['discount_percentage']."%"; } ?></td>-->
              <td align="center">-<?php  echo $product['discount_percentage']."%";  ?></td>
              <?php } ?>
             <td align="center"><?php echo $product['price']; $unitPriceTotal = $unitPriceTotal + $product['price_simple']; ?></td>
             <td align="center"><?php echo $product['quantity']; ?></td>
            <td align="center"><?php echo $product['total']; $unitTotal = $unitTotal + $product['total_simple']; ?></td>
            <?php if(!empty($isGSTAllowed)): ?>
            <?php if($this->session->data['shipping_zone_id'] == 1486): ?>
            <td align="center"><?php echo $product['tax_class_title'] / 2; ?></td>
            <td align="center"><?php echo number_format( ($product['tax_class_amount'] / 2),2);  
                        $cgstTotal = $cgstTotal + ($product['tax_class_amount_simple'] / 2);  ?></td>
            <td align="center"><?php echo $product['tax_class_title'] / 2;   ?></td>
            <td align="center"><?php echo number_format(($product['tax_class_amount'] / 2),2); 
                      	$sgstTotal = $sgstTotal + ($product['tax_class_amount_simple'] / 2);   ?></td>
            <td align="center"><?php  echo "-";  ?></td>
            <td align="center"><?php  echo 0; $igsttTotal = 0;   ?></td>
            <?php else: ?>
            <td align="center"><?php echo "-";   ?></td>
            <td align="center"><?php echo 0;  $cgstTotal = 0;  ?></td>
            <td align="center"><?php echo "-";    ?></td>
            <td align="center"><?php echo 0; 	$sgstTotal = 0;    ?></td>
            <td align="center"><?php echo $product['tax_class_title'];    ?></td>
            <td align="center"><?php echo number_format($product['tax_class_amount'],2); $igsttTotal = $igsttTotal + $product['tax_class_amount'];  ?></td>
            <?php endif; ?>
            <td align="center"><?php echo $product['total_price']; $totalPrice = $totalPrice + $product['total_price_simple']; ?></td>
            <?php endif; ?>
          </tr>
          <?php } else { ?>
          <tr>
            <td align="center"><?php echo ++$countFlag; ?></td>
            <td align="left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php foreach ($product['option'] as $option) { ?>
              <small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php if($product['recurring']): ?>
              <br />
              &nbsp;<small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
              <?php endif; ?></td>
            <td align="center"><?php echo $product['model']; ?></td>
            <td align="center"><?php echo $product['isbn']; ?></td>
            <?php if($discount_flag==1) { ?>
             <td align="center"><?php echo number_format($product['before_discount_price'],2); ?></td>
              <td align="center">-<?php  if($product['parent_category_id']=='18') { echo $product['discount_percentage']."%"; } ?></td>
              <?php } ?>
             <td align="center"><?php echo $product['price']; $unitPriceTotal = $unitPriceTotal + $product['price_simple']; ?></td>
             <td align="center"><?php echo $product['quantity']; ?></td>
            <td align="center"><?php echo $product['total']; $unitTotal = $unitTotal + $product['total_simple']; ?></td>
            <?php if(!empty($isGSTAllowed)): ?>
            <?php if($this->session->data['shipping_zone_id'] == 1486): ?>
            <td align="center"><?php echo $product['tax_class_title'] / 2; ?></td>
            <td align="center"><?php echo number_format( ($product['tax_class_amount'] / 2),2);  
                        $cgstTotal = $cgstTotal + ($product['tax_class_amount_simple'] / 2);  ?></td>
            <td align="center"><?php echo $product['tax_class_title'] / 2;   ?></td>
            <td align="center"><?php echo number_format(($product['tax_class_amount'] / 2),2); 
                      	$sgstTotal = $sgstTotal + ($product['tax_class_amount_simple'] / 2);   ?></td>
            <td align="center"><?php  echo "-";  ?></td>
            <td align="center"><?php  echo 0; $igsttTotal = 0;   ?></td>
            <?php else: ?>
            <td align="center"><?php echo "-";   ?></td>
            <td align="center"><?php echo 0;  $cgstTotal = 0;  ?></td>
            <td align="center"><?php echo "-";    ?></td>
            <td align="center"><?php echo 0; 	$sgstTotal = 0;    ?></td>
            <td align="center"><?php echo $product['tax_class_title'];    ?></td>
            <td align="center"><?php echo number_format($product['tax_class_amount'],2); $igsttTotal = $igsttTotal + $product['tax_class_amount'];  ?></td>
            <?php endif; ?>
            <td align="center"><?php echo $product['total_price']; $totalPrice = $totalPrice + $product['total_price_simple']; ?></td>
            <?php endif; ?>
          </tr>
          <?php } } ?>
          <?php foreach ($vouchers as $voucher) { ?>
          <tr>
            <td class="name"><?php echo $voucher['description']; ?></td>
            <td class="model mobile_remove"></td>
            <td class="price mobile_remove"><?php echo $voucher['amount']; ?></td>
            <td class="quantity">1</td>
            <td class="total"><?php echo $voucher['amount']; ?></td>
          </tr>
          <?php } ?>
          <tr>
            <?php if(!empty($isGSTAllowed)): ?>
            <?php if($discount_flag==1) { ?>   <td colspan="8"></td><?php }  else { ?> <td colspan="6"></td><?php } ?>
            <?php else: ?>
            <?php if($discount_flag==1) { ?>   <td colspan="8"></td><?php }  else { ?> <td colspan="6"></td><?php } ?>
            <?php endif; ?>
            <td align="center" style="font-weight:bold;"><?php echo $this->currency->format($unitTotal); ?></td>
            <?php if(!empty($isGSTAllowed)): ?>
            <td align="center" colspan="2" style="font-weight:bold;"><?php echo $this->currency->format($cgstTotal); ?></td>
            <td align="center" colspan="2" style="font-weight:bold;"><?php echo $this->currency->format($sgstTotal); ?></td>
            <td align="center" colspan="2" style="font-weight:bold;"><?php echo $this->currency->format($igsttTotal); ?></td>
            <td align="center" style="font-weight:bold;"><?php echo $this->currency->format($totalPrice); ?></td>
            <?php endif; ?>
          </tr>
        </tbody>
        <tfoot>
          <?php if(!empty($isGSTAllowed)): ?>
          <tr class="confirm_totals">
          <?php if($discount_flag==1) { ?>    <td colspan="15" class="price" ><?php }  else { ?>  <td colspan="13" class="price" > <?php } ?>
           <b><?php echo "Total Invoice Value" ?>:</b></td>
            <td class="total"><?php echo $this->currency->format($totalPrice); ?></td>
          </tr>
          <?php endif; ?>
          <?php foreach ($totals_display as $total) { ?>
          <tr class="confirm_totals">
            <?php if($total['code'] == 'sub_total') continue; ?>
              <?php //if($total['code'] == 'discount') continue; ?>
            <?php if(($total['code'] == 'tax') && (strstr($total['title'], 'GST'))) continue; ?>
            <?php if(!empty($isGSTAllowed)): ?>
            <?php if($discount_flag==1) { ?> <td colspan="15" class="price"> <?php } else {?> <td colspan="13" class="price"> <?php } ?>
            <b><?php echo $total['title']; ?>:</b></td>
            <?php else: ?>
             <?php if($discount_flag==1) { ?>  <td colspan="8" class="price"> <?php } else {?> <td colspan="6" class="price" align="center"> <?php } ?>
           <b><?php echo $total['title']; ?>:</b></td>
            <?php endif; ?>
            <td class="total"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </tfoot>
      </table>
      <div><?php  if(empty($isGSTAllowed)){  ?>**Freight will be advised separately. <?php } ?></div>
    </div>
    <?php //if(!empty($isGSTAllowed)){  ?>
    
    <div class="cart_bottom_line">
      <div class="payment"><?php echo $payment; ?></div>
    </div>
    <?php //} else { ?>
   <!-- <script language="javascript">
	alert("Please send us a mail at customercare@craftslane.com for the Freight Charge.");
	</script>-->
    	
    <?php // } ?>
    <div class="buttons">
      <div class="left"> <a href="index.php?route=common/home" class="button">CONTINUE SHOPPING</a> </div>
    </div>
    <?php } ?>
  </div>
</div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
<style type="text/css">
.cart_bottom_line_1 {
  background:#F9F9FA;
  border:1px solid #F0F0F2;
   margin-bottom:30px;
  padding:10px 20px;'
font-family:"Source Sans Pro", sans-serif;
}
</style>
