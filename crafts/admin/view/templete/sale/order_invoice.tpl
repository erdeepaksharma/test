<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
</head>
<body>
    <?php $shouldShowFreightMSG = false; ?>
<?php  foreach ($orders as $order) { ?>
<div style="page-break-after: always;">
  <h1><?php echo $text_invoice; ?></h1>
  <!-- Company Address-->
  <table class="store" >
    <tr>
      <td> <strong>GSTN : 06AGZPG2029A1ZN</strong><br />
<?php echo $order['store_name']; ?><br />
        <?php echo $order['store_address']; ?><br />
        <?php echo $text_telephone; ?> <?php echo $order['store_telephone']; ?><br />
        <?php if ($order['store_fax']) { ?>
        <?php echo $text_fax; ?> <?php echo $order['store_fax']; ?><br />
        <?php } ?>
        <?php echo $order['store_email']; ?><br />
        <?php echo $order['store_url']; ?></td>
      <td align="right" valign="top"><table>
          
          <?php if ($order['invoice_no']) { ?>
          <tr>
            <td><b><?php echo $text_invoice_no; ?></b></td>
            <td><span style="font-family: 'basawa_3_of_9_mhrregular'; font-size:30px !important;">*<?php echo $order['invoice_no']; ?>*</span> </td>
          </tr>
          <?php } ?>
		  <tr>
            <td><b><?php echo $text_date_added; ?></b></td>
            <td><?php echo $order['date_added']; ?></td>
          </tr>
          <tr>
            <td><b><?php echo $text_order_id; ?></b></td>
            <td><?php echo $order['order_id']; ?></td>
          </tr>
          <tr>
            <td><b><?php echo $text_payment_method; ?></b></td>
            <td><?php echo $order['payment_method']; ?></td>
          </tr>
          <?php if ($order['shipping_method']) { ?>
          <tr>
            <td><b><?php echo $text_shipping_method; ?></b></td>
            <td><?php echo $order['shipping_method']; ?></td>
          </tr>
          <?php } ?>
        </table></td>
    </tr>
  </table>
 <!-- shipping Address-->
  <table class="address" >
    <tr class="heading">
      <td width="50%"><b><?php echo $text_to; ?></b></td>
      <td width="50%"><b><?php echo $text_ship_to; ?></b></td>
    </tr>
    <tr>
      <td><?php echo $order['payment_address']; ?><br/>
        <?php echo $order['email']; ?><br/>
        <?php echo $order['telephone']; ?>
        <?php if ($order['fax']) { ?>
         <strong>GSTN: <?php echo $order['fax']; ?></strong>
           <?php } ?>
        <?php if ($order['payment_company_id']) { ?>
        <br/>
        <br/>
        <?php echo $text_company_id; ?> <?php echo $order['payment_company_id']; ?>
        <?php } ?>
        <?php if ($order['payment_tax_id']) { ?>
        <br/>
        <?php echo $text_tax_id; ?> <?php echo $order['payment_tax_id']; ?>
        <?php } ?></td>
      <td><?php echo $order['shipping_address']; ?></td>
    </tr>
  </table> 
  <!-- Product list-->
  <table class="product" >
    <tr class="heading">
      <td><b> S.No.</b></td>
      <td><b><?php echo "Product Name"; ?></b></td>
      <td><b><?php echo $column_model; ?></b></td>
      <td align="left"><b><?php echo "HSN Code"; ?></b></td>
      <td align="right"><b><?php echo "Qty"; ?></b></td>
     <td align="right"><b><?php echo "Unit Rate"; ?></b></td>
     <td align="right"><b><?php echo "Total"; ?></b></td>
     <td align="right"><b><?php echo "Disc."; ?></b></td>
       <td align="right"><b><?php echo "Amount"; ?></b></td>
     </tr>
    <?php $unitPriceTotalWithQuantity = $unitPriceTotal = $cgstTotal = $sgstTotal = $igsttTotal = $totalPrice = $countFlag = $unitTotal = 0;  // echo '<pre>'; print_r($order['product']);?>
    <?php $sgstAndCgst5PercentTotal =  $sgstAndCgst28PercentTotal = $sgstAndCgst18PercentTotal = $sgstAndCgst12PercentTotal = $igst5PercentTotal = $igst28PercentTotal =$igst18PercentTotal = $igst12PercentTotal = 0; ?>
    <?php 
   // echo '<pre>';print_r($order['product']); die;
    foreach ($order['product'] as $product) { ?>
    <tr>
      <td><?php echo ++$countFlag; ?></td>
      <td style="font-size:10px !important;"><?php echo $product['name']; ?><?php if($product['is_sample_sale']==1){ ?> <span style="color:#a7257d;font-weight:bold;">(Free) </span> <?php } ?>
        <?php foreach ($product['option'] as $option) { ?>
        <br />
        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
        <?php } ?></td>
      <td><?php echo $product['model']; ?></td>
      <td align="left"><?php echo $product['isbn']; ?></td>
      <td align="right"><?php echo $product['quantity']; ?></td>
      <td align="right"><?php echo number_format($product['before_discount_price'],2); ?></td>
   
       <td align="right"><?php echo number_format($product['before_discount_total'],2); 
       //echo number_format($product['price'],2); 
       $unitPriceTotal = $unitPriceTotal + $product['price']; $unitPriceTotalWithQuantity = $unitPriceTotalWithQuantity + ($product['price'] * $product['quantity']); ?></td>
         <td align="right"><?php if($product['discount_percentage']>0){ echo "-".$product['discount_percentage']."%"; } else { echo "0%";} ?></td>
      <td align="right"><?php echo number_format($product['total'],2); ?></td>
      <?php //session_start();echo '<pre>'.$payment_zone."++++".$payment_zone_code; print_r($this->session);?>
      
      
      <?php 
      // echo $product['tax_class_rate']."++++++++++++++++++++++++++++++++++++++++++<br/>";
      if($order['payment_zone_id']== 1486) {
        if($product['tax_class_rate'] == 28) {
          $sgstAndCgst28PercentTotal = $sgstAndCgst28PercentTotal + $product['tax_class_amount'];
        }elseif($product['tax_class_rate'] == 18) {
          $sgstAndCgst18PercentTotal = $sgstAndCgst18PercentTotal + $product['tax_class_amount'];
        }elseif($product['tax_class_rate'] == 5) {
          $sgstAndCgst5PercentTotal = $sgstAndCgst5PercentTotal + $product['tax_class_amount'];
        }elseif($product['tax_class_rate'] == 12) {
          $sgstAndCgst12PercentTotal = $sgstAndCgst12PercentTotal + $product['tax_class_amount'];
        }
      }else {
        if($product['tax_class_rate'] == 28) {
          $igst28PercentTotal = $igst28PercentTotal + $product['tax_class_amount'];
        }elseif($product['tax_class_rate'] == 18) {
          $igst18PercentTotal = $igst18PercentTotal + $product['tax_class_amount'];
        }elseif($product['tax_class_rate'] == 5) {
          $igst5PercentTotal = $igst5PercentTotal + $product['tax_class_amount'];
        }elseif($product['tax_class_rate'] == 12) {
          $igst12PercentTotal = $igst12PercentTotal + $product['tax_class_amount'];
        }       
      }

      
      
      ?>
      
    </tr>
    <?php } ?>
    <?php foreach ($order['voucher'] as $voucher) { ?>
    <tr>
      <td align="left"><?php echo $voucher['description']; ?></td>
      <td align="left"></td>
      <td align="right"> </td>
      <td align="right"><?php echo $voucher['amount']; ?></td>
      <td align="right"><?php echo $voucher['amount']; ?></td>
    </tr>
    <?php } ?>
    
                 
                <tr>                
	                <td colspan="7"></td>
 	                <td style="font-weight:bold;" align="right"><?php //echo number_format($unitPriceTotal, 2); ?></td>
                    <td style="font-weight:bold;" align="right"><?php echo number_format($unitPriceTotalWithQuantity, 2); ?></td>
                </tr>          
                <?php if(!empty($isGSTAllowed)): ?>
                <?php if($order['payment_zone_id']== 1486): ?>
                    <tr>
                        <td   align="right" colspan="7">
                            CGST 14% Output
                        </td>
                        <td   align="right">
                            14%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst28PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            SGST 14% Output
                        </td>
                        <td   align="right">
                            14%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst28PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            CGST 9% Output
                        </td>
                        <td   align="right">
                            9%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst18PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            SGST 9% Output
                        </td>
                        <td   align="right">
                            9%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst18PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            CGST 6% Output
                        </td>
                        <td   align="right">
                            6%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst12PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            SGST 6% Output
                        </td>
                        <td   align="right">
                            6%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst12PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            CGST 2.5% Output
                        </td>
                        <td   align="right">
                            2.5%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst5PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            SGST 2.5% Output
                        </td>
                        <td   align="right">
                            2.5%
                        </td>
                        <td   align="right">
                            <?php echo number_format(($sgstAndCgst5PercentTotal/2), 2); ?>
                        </td>
                    </tr>
                <?php else: ?>
                    <tr>
                        <td   align="right" colspan="7">
                            IGST 28% Output
                        </td>
                        <td   align="right">
                            28%
                        </td>
                        <td   align="right">
                            <?php echo number_format($igst28PercentTotal, 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            IGST 18% Output
                        </td>
                        <td   align="right">
                            18%
                        </td>
                        <td   align="right">
                            <?php echo number_format($igst18PercentTotal, 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            IGST 12% Output
                        </td>
                        <td   align="right">
                            12%
                        </td>
                        <td   align="right">
                            <?php echo number_format($igst12PercentTotal, 2); ?>
                        </td>
                    </tr>
                    <tr>
                        <td   align="right" colspan="7">
                            IGST 5% Output
                        </td>
                        <td   align="right">
                            5% 
                        </td>
                        <td   align="right">
                            <?php echo number_format($igst5PercentTotal, 2); ?>
                        </td>
                    </tr>
                    
                <?php endif; ?>
                <?php endif; ?>
                <?php $flag_sac=$flag_tax_amount=0;$getTotalwithoutCouponInWorld = $str='';?>
               <?php $isFreightAvailable = false; ?>
               <?php //echo '<pre>';  print_r($order['total']);?>
    				<?php foreach($order['total'] as $total) { ?>
                   
                    <?php
                    if($total['code'] == 'freight') {
                        $isFreightAvailable = true;
                    }                    
                    ?>
                                
                    <?php if($total['code'] == 'sub_total') continue; ?>
                    <?php if(($total['code'] == 'tax') && (strstr($total['title'], 'GST'))) continue; ?>
                    <?php if(($total['code'] == 'tax') && (strstr($total['title'], 'SAC'))) continue; ?>
                    
                    <?php 
                    if($flag_coupon==1){
                            if($total['code'] == 'total'){
                                $total['title']='Total to Pay';
                                $getTotalInWorld = "Total to Pay (INR): " . getIndianCurrency($total['value']);
                            }
                            if($total['code'] == 'without_coupon'){
                                  $getTotalwithoutCouponInWorld = "Total Invoice Value (INR): " . getIndianCurrency($total['value']);
                           }
                     }
                     else{
                     		if($total['code'] == 'total'){
                                $total['title']='Total Invoice Value';
                                $getTotalInWorld = "Total Invoice Value (INR): " . getIndianCurrency($total['value']);
                            }
                     }
                    if($total['code'] == 'coupon'){
                    	$total['title']='Discount '. ucfirst($total['title']);
                    }
                    ?>
                     <?php if($total['code']=='handling') { 
                        $flag_sac=1;
                        $flag_tax_amount=18.31;
                       	$total['value'] =120;
                     }?> 
                    
         <tr>
            <td align="right" colspan="8" style="font-weight:bold;" ><b><?php echo $total['title']; ?>:</b></td>
      		<td style="font-size:14px;font-weight:bold;" align="right"><strong><?php echo number_format($total['value'], 2); ?></strong></td>
        </tr>
    			  
               
                  <?php if($total['code']=='without_coupon') { 
                  $str=' <tr>
                        <td align="right" colspan="7" >
                            <strong>'.$getTotalwithoutCouponInWorld.'</strong>
                        </td>
                    </tr>';
    
                   }?> 
                  
                     
    <?php } echo $str;?>
                    <tr>
                        <td align="right" colspan="9"    >
                            <strong><?php echo $getTotalInWorld; ?></strong>
                        </td>
                    </tr>
    
  </table>
  <?php //echo '<pre>';print_r($order);?>
    <?php if(!empty($isGSTAllowed)): ?>
    <?php if($order['payment_zone_id']== 1486): ?>
    <table class="product"  >
        <tr class="heading">
           <td style="font-weight: bold;">
               S.No.
            </td>
            <td style="font-weight: bold;">
            <?php if(  $flag_sac==1){?>
                HSN / SAC Code
                <?php } else { ?>
                   HSN Code
                <?php } ?>
            </td>
            <td style="font-weight: bold;" align="right">
                Taxable Value
            </td>
            <td style="font-weight: bold;" colspan="1">
                <span style="padding-left: 35%;" >Central Tax</span><br />
                <span style="float:left; padding-left: 10px; padding-top: 10px;">Rate</span> 
                <span style="float:right; padding-right: 10px; padding-top: 10px;">Amount</span>
            </td>
            <td style="font-weight: bold;" colspan="1">
                <span style="padding-left: 35%;" >State Tax</span><br />
                <span style="float:left; padding-left: 10px; padding-top: 10px;">Rate</span> 
                <span style="float:right; padding-right: 10px; padding-top: 10px;">Amount</span>
            </td>
        </tr>
        <?php $secondTableProductTotal = $secondTableTaxAmount = $secondTableCGSTTaxAmount = $secondTableSGSTTaxAmount = 0;$h=0; ?>
        <?php foreach ($order['product'] as $product): $h++;?>
        <tr style="font-style:italic !important;">
        <td><?php echo $h; ?></td>
            <td>
                <?php echo $product['isbn'] ?>
            </td>
            <td align="right">
                <?php $secondTableProductTotal = $secondTableProductTotal + ($product['price'] * $product['quantity']);  ?>
                <?php echo number_format($product['total'], 2); ?>
            </td>
            <td>
                <span style="float:left; padding-left: 10px; ">
                    <?php echo (isset($product['tax_class_rate']) && !empty($product['tax_class_rate']))? $product['tax_class_rate']/2 . '%': '-'; ?>
                </span>
                <span style="float:right; padding-right: 10px;  ">
                    <?php $secondTableCGSTTaxAmount = $secondTableCGSTTaxAmount + ($product['tax_class_amount']/2); ?>
                    <?php echo number_format($product['tax_class_amount']/2, 2); ?>
                </span>
            </td>
            <td>
                <span style="float:left; padding-left: 10px;  ">
                    <?php echo (isset($product['tax_class_rate']) && !empty($product['tax_class_rate']))? $product['tax_class_rate']/2 . '%': '-'; ?>
                </span>
                <span style="float:right; padding-right: 10px; ">
                    <?php $secondTableSGSTTaxAmount = $secondTableSGSTTaxAmount + ($product['tax_class_amount']/2); ?>
                    <?php echo number_format($product['tax_class_amount']/2, 2); ?>
                </span>
            </td>
        </tr>
        <?php endforeach; ?>
        <?php if($flag_sac==1) { ?>
        <tr style="font-style:italic !important;">
        <td><?php echo $h+1; ?></td>
            <td>
                 9967
            </td>
            <td align="right">
                <?php $secondTableProductTotal = $secondTableProductTotal + 101.70  ;  ?>
                <?php echo number_format(101.70, 2); ?>
            </td>
            <td>
                <span style="float:left; padding-left: 10px; ">
                    9%
                </span>
                <span style="float:right; padding-right: 10px;  ">
                    <?php $secondTableCGSTTaxAmount = $secondTableCGSTTaxAmount + ($flag_tax_amount/2); ?>
                    <?php echo number_format($flag_tax_amount/2, 2); ?>
                </span>
            </td>
            <td>
                <span style="float:left; padding-left: 10px;  ">
                   9%
                </span>
                <span style="float:right; padding-right: 10px; ">
                    <?php $secondTableSGSTTaxAmount = $secondTableSGSTTaxAmount + ($flag_tax_amount/2); ?>
                    <?php echo number_format($flag_tax_amount/2, 2); ?>
                </span>
            </td>
        </tr>
        <?php } ?>
        <tr>
            <td style="font-weight: bold;" colspan="2" align="right">
                Total:
            </td>
            <td style="font-weight: bold;" align="right">
                <?php echo number_format($secondTableProductTotal,2);   ?>
            </td>
            <td align="right" style="font-weight: bold; padding-right: 10px;  ">
                <?php echo number_format($secondTableCGSTTaxAmount,2) ;  ?>
            </td>
            <td align="right" style="font-weight: bold; padding-right: 10px;  ">
                <?php echo number_format($secondTableSGSTTaxAmount,2);  ?>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="right" >
                <strong><em><?php echo "Tax Amount (INR): " . getIndianCurrency($secondTableCGSTTaxAmount + $secondTableSGSTTaxAmount); ?></em></strong>
            </td>
        </tr>
    </table>
    <?php else: ?>
    <table class="product"  >
        <tr class="heading">
        <td style="font-weight: bold;">
               S.No.
            </td>
            <td style="font-weight: bold;">
                 <?php if(  $flag_sac==1){?>
                HSN / SAC Code
                <?php } else { ?>
                   HSN Code
                <?php } ?>
            </td>
            <td style="font-weight: bold;" align="right">
                Taxable Value
            </td>
            <td style="font-weight: bold;" colspan="1">
                <span style="padding-left: 45%;">IGST Tax</span><br />
                <span style="float:left; padding-left: 10px; padding-top: 10px;">Rate</span> 
                <span style="float:right; padding-right: 10px; padding-top: 10px;">Amount</span>
            </td>
        </tr>
        <?php $secondTableProductTotal = $secondTableTaxAmount = 0; $h=0; ?>
        <?php foreach ($order['product'] as $product): $h++;?>
        <tr style="font-style:italic !important;">
       		<td><?php echo $h; ?></td>
            <td><?php echo $product['isbn'] ?></td>
            <td align="right"> <?php $secondTableProductTotal = $secondTableProductTotal + ($product['price'] * $product['quantity']);  ?>
                <?php echo number_format($product['total'], 2); ?> </td>
            <td>
                <span style="float:left; padding-left: 10px; ">
                    <?php echo (isset($product['tax_class_rate']) && !empty($product['tax_class_rate']))? $product['tax_class_rate'] . '%': '-'; ?>
                </span>
                <span style="float:right; padding-right: 10px;  ">
                    <?php $secondTableTaxAmount = $secondTableTaxAmount + $product['tax_class_amount']; ?>
                    <?php echo number_format($product['tax_class_amount'], 2); ?>
                </span>
            </td>
        </tr>
        <?php endforeach; ?>
        <?php if($flag_sac==1) { ?>
        <tr style="font-style:italic !important;">
       		<td><?php echo $h+1; ?></td>
            <td>9967</td>
            <td align="right"> <?php $secondTableProductTotal = $secondTableProductTotal +101.70;  ?>
                <?php echo number_format(101.70, 2); ?> </td>
            <td>
                <span style="float:left; padding-left: 10px; ">
                    18%
                </span>
                <span style="float:right; padding-right: 10px;  ">
                    <?php $secondTableTaxAmount = $secondTableTaxAmount + $flag_tax_amount; ?>
                    <?php echo number_format($flag_tax_amount, 2); ?>
                </span>
            </td>
        </tr>
        <?php } ?>
        <tr>
            <td style="font-weight: bold;" colspan="2" align="right">
                Total:
            </td>
            <td style="font-weight: bold;" align="right">
                <?php echo number_format($secondTableProductTotal,2);  ?>
            </td>
            <td align="right" style="font-weight: bold; padding-right: 10px;  ">
                <?php echo number_format($secondTableTaxAmount,2);  ?>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right" >
                <strong><em><?php echo "Tax Amount (INR): " . getIndianCurrency($secondTableTaxAmount); ?></em></strong>
            </td>
        </tr>
    </table>
    <?php endif; ?>
    <?php endif; ?>
  
  
  <?php if( empty($isGSTAllowed)){ ?>
  <p align="left">**Note: Freight will be advised separately. </p>
  <?php } ?>
  <?php if ($order['comment']) { ?>
  <table class="comment">
    <tr class="heading">
      <td><b><?php echo $column_comment; ?></b></td>
    </tr>
    <tr>
      <td><?php echo $order['comment']; ?></td>
    </tr>
  </table>
  
  <?php } ?>
  
  <?php   if($customer_orders==1 && $unitPriceTotalWithQuantity >=2000){ ?>
  <!--<table width="100%">
     <tr>
      <td style="color:#4169e1;"><strong><em>**Welcome on board! We at Craftslane are delighted to welcome you into the exciting world of crafting with the Craftslane Starter Kit! Happy Crafting!</em></strong></td>
    </tr>
  </table>-->
  <?php } ?>
   <div style="margin:20px;text-align:right;font-weight:bold; " ><b>FOR CRAFTSLANE</b></div> 
   <br />
   <?php if(empty($isGSTAllowed) && empty($isFreightAvailable)): ?>
        <div  style="margin:20px;text-align:left;font-weight:bold; " ><b>Freight will be advised separately.</b> </div>
   <?php endif; ?>
  <div  style="margin:20px;text-align:right;font-weight:bold; " ><b>Authorized Signatory </b> </div>
 </div>
<?php } ?>

</body>
</html>

<?php
    function getIndianCurrency(float $number) {
        $decimal = round($number - ($no = floor($number)), 2) * 100;
        $hundred = null;
        $digits_length = strlen($no);
        $i = 0;
        $str = array();
         
        $words = array(0 => ' ',
            1 => 'One',
            2 => 'Two',
            3 => 'Three',
            4 => 'Four',
            5 => 'Five',
            6 => 'Six',
            7 => 'Seven',
            8 => 'Eight',
            9 => 'Nine',
            10 => 'Ten',
            11 => 'Eleven',
            12 => 'Twelve',
            13 => 'Thirteen',
            14 => 'Fourteen',
            15 => 'Fifteen',
            16 => 'Sixteen',
            17 => 'Seventeen',
            18 => 'Eighteen',
            19 => 'Nineteen',
            20 => 'Twenty',
            21 => 'Twenty One',
            22 => 'Twenty Two',
            23 => 'Twenty Three',
            24 => 'Twenty Four',
            25 => 'Twenty Five',
            26 => 'Twenty Six',
            27 => 'Twenty Seven',
            28 => 'Twenty Eight',
            29 => 'Twenty Nine',
            30 => 'Thirty',
            31 => 'Thirty One',
            32 => 'Thirty Two',
            33 => 'Thirty Three',
            34 => 'Thirty Four',
            35 => 'Thirty Five',
            36 => 'Thirty Six',
            37 => 'Thirty Seven',
            38 => 'Thirty Eight',
            39 => 'Thirty Nine',
            40 => 'Forty',
            41 => 'Forty One',
            42 => 'Forty Two',
            43 => 'Forty Three',
            44 => 'Forty Four',
            45 => 'Forty Five',
            46 => 'Forty Six',
            47 => 'Forty Seven',
            48 => 'Forty Eight',
            49 => 'Forty Nine',
            50 => 'Fifty',
            51 => 'Fifty One',
            52 => 'Fifty Two',
            53 => 'Fifty Three',
            54 => 'Fifty Four',
            55 => 'Fifty Five',
            56 => 'Fifty Six',
            57 => 'Fifty Seven',
            58 => 'Fifty Eight',
            59 => 'Fifty Nine',
            60 => 'Sixty',
            61 => 'Sixty One',
            62 => 'Sixty Two',
            63 => 'Sixty Three',
            64 => 'Sixty Four',
            65 => 'Sixty Five',
            66 => 'Sixty Six',
            67 => 'Sixty Seven',
            68 => 'Sixty Eight',
            69 => 'Sixty Nine',
            70 => 'Seventy',
            71 => 'Seventy One',
            72 => 'Seventy Two',
            73 => 'Seventy Three',
            74 => 'Seventy Four',
            75 => 'Seventy Five',
            76 => 'Seventy Six',
            77 => 'Seventy Seven',
            78 => 'Seventy Eight',
            79 => 'Seventy Nine',
            80 => 'Eighty',
            81 => 'Eighty One',
            82 => 'Eighty Two',
            83 => 'Eighty Three',
            84 => 'Eighty Four',
            85 => 'Eighty Five',
            86 => 'Eighty Six',
            87 => 'Eighty Seven',
            88 => 'Eighty Eight',
            89 => 'Eighty Nine',
            90 => 'Ninety',
            91 => 'Ninety One',
            92 => 'Ninety Two',
            93 => 'Ninety Three',
            94 => 'Ninety Four',
            95 => 'Ninety Five',
            96 => 'Ninety Six',
            97 => 'Ninety Seven',
            98 => 'Ninety Eight',
            99 => 'Ninety Nine');
        $digits = array('', 'Hundred', 'Thousand', 'Lakh', 'Crore');
        while ($i < $digits_length) {
            $divider = ($i == 2) ? 10 : 100;
            $number = floor($no % $divider);
            $no = floor($no / $divider);
            $i += $divider == 10 ? 1 : 2;
            if ($number) {
                $plural = (($counter = count($str)) && $number > 9) ? 's' : null;
                $hundred = ($counter == 1 && $str[0]) ? ' ' : null;
                $str [] = ($number < 21) ? $words[$number] . ' ' . $digits[$counter] . $plural . ' ' . $hundred : $words[floor($number / 10) * 10] . ' ' . $words[$number % 10] . ' ' . $digits[$counter] . $plural . ' ' . $hundred;
            } else
                $str[] = null;
        }
        $Rupees = implode('', array_reverse($str));
        $paise = ($decimal) ? " and " . $words[$decimal] . ' Paise' : '';
        return ($Rupees ? $Rupees . 'Rupees ' : '') . $paise . " Only";
    }
?>