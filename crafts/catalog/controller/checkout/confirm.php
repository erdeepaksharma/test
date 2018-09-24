<?php

class ControllerCheckoutConfirm extends Controller {

    public function index() {
        $redirect = '';
		$this->data['isOrderAllowed'] =0;
        $this->data['isGSTAllowed'] = ($this->session->data['shipping_country_id'] == 99) ? true : false;
        if ($this->cart->hasShipping()) {
            // Validate if shipping address has been set.		
            $this->load->model('account/address');

            if ($this->customer->isLogged() && isset($this->session->data['shipping_address_id'])) {
                $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
            } elseif (isset($this->session->data['guest'])) {
                $shipping_address = $this->session->data['guest']['shipping'];
            }

            if (empty($shipping_address)) {
                $redirect = $this->url->link('checkout/checkout', '', 'SSL');
            }

            // Validate if shipping method has been set.	
            if (!isset($this->session->data['shipping_method'])) {
               // $redirect = $this->url->link('checkout/checkout', '', 'SSL');
            }
			 unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
        } else {
            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
        }

        // Validate if payment address has been set.
        $this->load->model('account/address');

        if ($this->customer->isLogged() && isset($this->session->data['payment_address_id'])) {
            $payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
        } elseif (isset($this->session->data['guest'])) {
            $payment_address = $this->session->data['guest']['payment'];
        }

        if (empty($payment_address)) {
            $redirect = $this->url->link('checkout/checkout', '', 'SSL');
        }

        // Validate if payment method has been set.	
        if (!isset($this->session->data['payment_method'])) {
            $redirect = $this->url->link('checkout/checkout', '', 'SSL');
        }

        // Validate cart has products and has stock.	
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $redirect = $this->url->link('checkout/cart');
        }

        // Validate minimum quantity requirments.			
        $products = $this->cart->getProducts();

        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $redirect = $this->url->link('checkout/cart');

                break;
            }
        }

        if (!$redirect) {
            $total_data = array();
			$total_data_org = array();
            $total = 0;
            $taxes = $this->cart->getTaxes();
            
            $this->load->model('setting/extension');

            $sort_order = array();

            $results = $this->model_setting_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

			
          
		    array_multisort($sort_order, SORT_ASC, $results);
            foreach ($results as $result) {
 						 
                if ($this->config->get($result['code'] . '_status')) {
                    if(!empty($this->data['isGSTAllowed'])) {
                        if($result['code'] == 'freight')
                            continue;
                    }else {
                       // if($result['code'] == 'handling')
                           // continue;
                    }
                   
//                    continue;
					
                    $this->load->model('total/' . $result['code']);

                    $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
                }
            }

            $sort_order = array();


            $gstAmount = 0;
            $unsetKey = 1;
			$discount_flag = 0;
			$tempTotal_data1 = array();
			$tempTotal_data2 = array();
			$tax_ammt =0;
			$tax_ammt_handling = 0;
			//
			//  echo '<pre>';print_r($total_data);
            if (!empty($this->data['isGSTAllowed'])) {
                foreach ($total_data as $key => $value) {
                    if (($value['code'] == "tax") && strstr($value['title'], "GST")) {
                        $gstAmount = $gstAmount + ((int) $value['value']);
                        $unsetKey = $key;
                        unset($total_data[$key]);
                    }
                }
				
						 
                if (!empty($gstAmount)) {
                    if ($this->session->data['shipping_zone_id'] == 1486) {
                        $total_data[] = array(
                            "code" => "tax",
                            "title" => "CGST",
                            "text" => $gstAmount / 2, //$this->currency->format($gstAmount / 2),
                            "value" => $gstAmount / 2,
                            "sort_order" => 2,
                        );

                        $total_data[] = array(
                            "code" => "tax",
                            "title" => "SGST",
                            "text" => $gstAmount / 2, // $this->currency->format($gstAmount / 2),
                            "value" => $gstAmount / 2,
                            "sort_order" => 2,
                        );
                    } else {
                        $total_data[] = array(
                            "code" => "tax",
                            "title" => "IGST",
                            "text" => $gstAmount, // $this->currency->format($gstAmount),
                            "value" => $gstAmount,
                            "sort_order" => 2,
                        );
                    }
                }
            }
$total_data_org = $total_data;
            foreach ($total_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
				
				if($value['code'] == 'discount' ){  
						 $discount_flag = 1;}
						 
						if($value['code'] == 'handling' || $value['title'] == 'SAC' ){ 
				 
						  $tax_ammt_handling = $tax_ammt_handling+$value['value'];
		  					$tempTotal_data2[0]=array(
								'code' => "handling",
								'title' => 'Handling Fee',
								'text' => $this->currency->format($tax_ammt_handling) ,
								'value' => $tax_ammt_handling,
								'sort_order' => '2'
		 						);
						 
						 }
						 else
						 {
							 $tempTotal_data1[] = $value; 
						 }
						 
						 
            }
$total_data= array_merge($tempTotal_data1,$tempTotal_data2);
			// $total_data[$unsetKey] = $gstAmount;
          // echo '<pre>';
            // echo $gstAmount;
          //   print_R($total_data); die;
	 	    $this->data['discount_flag']=$discount_flag;
 			if (empty($this->data['isGSTAllowed']) && $gstAmount==0) {
	 
	 $arr_total_val_inr = $this->cart->getSubTotal();
	 $arr_total_val_usd =  $this->currency->convert($arr_total_val_inr,'INR','USD');
	 $arr_total_val_euro =  $this->currency->convert($arr_total_val_inr,'INR','EUR');
	 $arr_total_val_pound =  $this->currency->convert($arr_total_val_inr,'INR','GBP');
	 
	 $compair_val_inr =  1501;
	 $compair_val_usd =  $this->currency->convert($compair_val_inr,'INR','USD');
	 $compair_val_euro =  $this->currency->convert($compair_val_inr,'INR','EUR');
	 $compair_val_pound =  $this->currency->convert($compair_val_inr,'INR','GBP');
	// echo    $compair_val_inr."++++++++".$compair_val_usd ."++++++++".$compair_val_euro."++++++++".$compair_val_pound."<br/>";
	 if($this->session->data['currency']=='INR'  && $arr_total_val_inr< $compair_val_inr){
		 
		  echo   $this->error['warning'] = 'Minimum Order should be greater than Rs. '.number_format($compair_val_inr,2).'. Kindly add some more items to your cart!!  ';
		  $this->data['isOrderAllowed'] =1;
		 // die;
	 }
	 else if($this->session->data['currency']=='USD' && $arr_total_val_usd<$compair_val_usd){
			  echo   $this->error['warning'] = 'Minimum Order should be greater than '. number_format($compair_val_usd,2).' '. $this->session->data['currency'].'. Kindly add some more items to your cart!!';
			   $this->data['isOrderAllowed'] =1;
			//   die;
		  }
	elseif($this->session->data['currency']=='EUR' && $arr_total_val_euro<$compair_val_euro){
			  echo   $this->error['warning'] = 'Minimum Order should be greater than '. number_format($compair_val_euro,2).' '. $this->session->data['currency'].'. Kindly add some more items to your cart!!';
			   $this->data['isOrderAllowed'] =1;
			//   die;
		  }
	elseif($this->session->data['currency']=='GBP' && $arr_total_val_pound<$compair_val_pound ){
			  echo   $this->error['warning'] = 'Minimum Order should be greater than '. number_format($compair_val_pound,2) .' '. $this->session->data['currency'].'. Kindly add some more items to your cart!!';
			   $this->data['isOrderAllowed'] =1;
			//   die;
	 }
	else{ }   
		 
	 
 }
  $sort_order = array();

                    foreach ($total_data as $key => $value) {
                        $sort_order[$key] = $value['sort_order'];
                    }

                    array_multisort($sort_order, SORT_ASC, $total_data);
            array_multisort($sort_order, SORT_ASC, $total_data_org);

            $this->language->load('checkout/checkout');

            $data = array();

            $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
            $data['store_id'] = $this->config->get('config_store_id');
            $data['store_name'] = $this->config->get('config_name');

            if ($data['store_id']) {
                $data['store_url'] = $this->config->get('config_url');
            } else {
                $data['store_url'] = HTTP_SERVER;
            }

            if ($this->customer->isLogged()) {
                $data['customer_id'] = $this->customer->getId();
                $data['customer_group_id'] = $this->customer->getCustomerGroupId();
                $data['firstname'] = $this->customer->getFirstName();
                $data['lastname'] = $this->customer->getLastName();
                $data['email'] = $this->customer->getEmail();
                $data['telephone'] = $this->customer->getTelephone();
                $data['fax'] = $this->customer->getFax();

                $this->load->model('account/address');

                $payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
            } elseif (isset($this->session->data['guest'])) {
                $data['customer_id'] = 0;
                $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
                $data['firstname'] = $this->session->data['guest']['firstname'];
                $data['lastname'] = $this->session->data['guest']['lastname'];
                $data['email'] = $this->session->data['guest']['email'];
                $data['telephone'] = $this->session->data['guest']['telephone'];
                $data['fax'] = $this->session->data['guest']['fax'];

                $payment_address = $this->session->data['guest']['payment'];
            }

            $data['payment_firstname'] = $payment_address['firstname'];
            $data['payment_lastname'] = $payment_address['lastname'];
            $data['payment_company'] = $payment_address['company'];
            $data['payment_company_id'] = $payment_address['company_id'];
            $data['payment_tax_id'] = $payment_address['tax_id'];
            $data['payment_address_1'] = $payment_address['address_1'];
            $data['payment_address_2'] = $payment_address['address_2'];
            $data['payment_city'] = $payment_address['city'];
            $data['payment_postcode'] = $payment_address['postcode'];
            $data['payment_zone'] = $payment_address['zone'];
            $data['payment_zone_id'] = $payment_address['zone_id'];
            $data['payment_country'] = $payment_address['country'];
            $data['payment_country_id'] = $payment_address['country_id'];
            $data['payment_address_format'] = $payment_address['address_format'];
			
			$subtotalDisplay =$this->cart->getSubTotal();
  			if(isset($this->session->data['currency'])) $currCurrency =$this->session->data['currency'];
  			else $currCurrency ='INR';
  			$IsDisplayMessage = 0;
   			 if($subtotalDisplay < 1500 &&  $currCurrency =='INR' ){
				$IsDisplayMessage = 1; 
				
			 }
			$this->data['IsDisplayMessage'] =$IsDisplayMessage;
			
			
            if (isset($this->session->data['payment_method']['title'])) {
                $data['payment_method'] = $this->session->data['payment_method']['title'];
            } else {
                $data['payment_method'] = '';
            }

            if (isset($this->session->data['payment_method']['code'])) {
                $data['payment_code'] = $this->session->data['payment_method']['code'];
            } else {
                $data['payment_code'] = '';
            }

            if ($this->cart->hasShipping()) {
                if ($this->customer->isLogged()) {
                    $this->load->model('account/address');

                    $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
                } elseif (isset($this->session->data['guest'])) {
                    $shipping_address = $this->session->data['guest']['shipping'];
                }

                $data['shipping_firstname'] = $shipping_address['firstname'];
                $data['shipping_lastname'] = $shipping_address['lastname'];
                $data['shipping_company'] = $shipping_address['company'];
                $data['shipping_address_1'] = $shipping_address['address_1'];
                $data['shipping_address_2'] = $shipping_address['address_2'];
                $data['shipping_city'] = $shipping_address['city'];
                $data['shipping_postcode'] = $shipping_address['postcode'];
                $data['shipping_zone'] = $shipping_address['zone'];
                $data['shipping_zone_id'] = $shipping_address['zone_id'];
                $data['shipping_country'] = $shipping_address['country'];
                $data['shipping_country_id'] = $shipping_address['country_id'];
                $data['shipping_address_format'] = $shipping_address['address_format'];

                if (isset($this->session->data['shipping_method']['title'])) {
                    $data['shipping_method'] = $this->session->data['shipping_method']['title'];
                } else {
                    $data['shipping_method'] = '';
                }

                if (isset($this->session->data['shipping_method']['code'])) {
                    $data['shipping_code'] = $this->session->data['shipping_method']['code'];
                } else {
                    $data['shipping_code'] = '';
                }
            } else {
                $data['shipping_firstname'] = '';
                $data['shipping_lastname'] = '';
                $data['shipping_company'] = '';
                $data['shipping_address_1'] = '';
                $data['shipping_address_2'] = '';
                $data['shipping_city'] = '';
                $data['shipping_postcode'] = '';
                $data['shipping_zone'] = '';
                $data['shipping_zone_id'] = '';
                $data['shipping_country'] = '';
                $data['shipping_country_id'] = '';
                $data['shipping_address_format'] = '';
                $data['shipping_method'] = '';
                $data['shipping_code'] = '';
            }

            $product_data = array();
			$dis_tax =  0;
			$dis_price =  0;
            foreach ($this->cart->getProducts() as $product) { 
			
			//	if(empty($this->data['isGSTAllowed'])  && $product['is_sample_sale']==1) 
			//		continue;
					
                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['option_value'];
                    } else {
                        $value = $this->encryption->decrypt($option['option_value']);
                    }

                    $option_data[] = array(
                        'product_option_id' => $option['product_option_id'],
                        'product_option_value_id' => $option['product_option_value_id'],
                        'option_id' => $option['option_id'],
                        'option_value_id' => $option['option_value_id'],
                        'name' => $option['name'],
                        'value' => $value,
                        'type' => $option['type']
                    );
                }
				
                // DEEPAK: [TAX]
                if (!empty($this->data['isGSTAllowed'])  ) {
                    $getTax = $this->tax->getTax($product['price'], $product['tax_class_id']);
                } else {
                    $getTax = 0;
                }
			//	if($product['parent_category_id']!=18) 
				//	$product['discount_percentage']=0;
				
				
                $product_data[] = array(
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'download' => $product['download'],
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
                    'price' => $product['price'],
                    'total' => $product['total'],
					'is_sample_sale' =>$product['is_sample_sale'],
					'before_discount_price'     => $product['before_discount_price'],
					'before_discount_total'     => $product['before_discount_total'],
					'discount_percentage'       => $product['discount_percentage'],
					'parent_category_id'       => $product['parent_category_id'],
                    'tax' => $getTax,
                    'reward' => $product['reward']
                );
               
			 
			if($product['is_sample_sale'] ==1 ){
				$dis_tax =  $dis_tax + $getTax;
				$dis_price =  $dis_price + $product['price'];
			}
			   
			 
} //echo '<pre>';print_r($product_data);die;
					//promo discount
				$order_tot =$this->cart->getTotal();
if($order_tot>=3500 && $order_tot<=19999 && !empty($this->data['isGSTAllowed'])){
	 $total_data[] = array( 
				"code"=>"discount",
				"title"=>"Total Discount/Gift",
				"text"=>$this->currency->format(-$dis_price-$dis_tax  ),
				"value"=>-$dis_price-$dis_tax,
				"sort_order"=>4
				
			 );
			  $total_data_org[] = array( 
				"code"=>"discount",
				"title"=>"Total Discount/Gift",
				"text"=>$this->currency->format(-$dis_price-$dis_tax  ),
				"value"=>-$dis_price-$dis_tax,
				"sort_order"=>4
				
			 );
			$sort_order = array(); 



				foreach ($total_data as $key => $value) {

					$sort_order[$key] = $value['sort_order'];

				}



				array_multisort($sort_order, SORT_ASC, $total_data);
				array_multisort($sort_order, SORT_ASC, $total_data_org);
            }
			 

            // Gift Voucher
            $voucher_data = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $voucher) {
                    $voucher_data[] = array(
                        'description' => $voucher['description'],
                        'code' => substr(md5(mt_rand()), 0, 10),
                        'to_name' => $voucher['to_name'],
                        'to_email' => $voucher['to_email'],
                        'from_name' => $voucher['from_name'],
                        'from_email' => $voucher['from_email'],
                        'voucher_theme_id' => $voucher['voucher_theme_id'],
                        'message' => $voucher['message'],
                        'amount' => $voucher['amount']
                    );
                }
            }

            $data['products'] = $product_data;
            $data['vouchers'] = $voucher_data;
            $data['totals'] = $total_data_org;
			$data['totals_display'] = $total_data;
            $data['comment'] = $this->session->data['comment'];
            $data['total'] = $total;

            if (isset($this->request->cookie['tracking'])) {
                $this->load->model('affiliate/affiliate');

                $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
                $subtotal = $this->cart->getSubTotal();

                if ($affiliate_info) {
                    $data['affiliate_id'] = $affiliate_info['affiliate_id'];
                    $data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
                } else {
                    $data['affiliate_id'] = 0;
                    $data['commission'] = 0;
                }
            } else {
                $data['affiliate_id'] = 0;
                $data['commission'] = 0;
            }

            $data['language_id'] = $this->config->get('config_language_id');
            $data['currency_id'] = $this->currency->getId();
            $data['currency_code'] = $this->currency->getCode();
            $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
            $data['ip'] = $this->request->server['REMOTE_ADDR'];

            if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
            } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
            } else {
                $data['forwarded_ip'] = '';
            }

            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
            } else {
                $data['user_agent'] = '';
            }

            if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
                $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
            } else {
                $data['accept_language'] = '';
            }

            $this->load->model('checkout/order');

            $this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);

            $this->data['column_name'] = $this->language->get('column_name');
            $this->data['column_model'] = $this->language->get('column_model');
            $this->data['column_quantity'] = $this->language->get('column_quantity');
            $this->data['column_price'] = $this->language->get('column_price');
            $this->data['column_total'] = $this->language->get('column_total');

            $this->data['text_recurring_item'] = $this->language->get('text_recurring_item');
            $this->data['text_payment_profile'] = $this->language->get('text_payment_profile');

            $this->data['products'] = array();
//echo '<pre>'; print_r($this->cart->getProducts());
            foreach ($this->cart->getProducts() as $product) { //echo $this->data['isGSTAllowed']."+++++++++". $product['is_sample_sale']."<br/>"; 
  				
                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['option_value'];
                    } else {
                        $filename = $this->encryption->decrypt($option['option_value']);

                        $value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
                    }

                    $option_data[] = array(
                        'name' => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }


                $profile_description = '';

                if ($product['recurring']) {
                    $frequencies = array(
                        'day' => $this->language->get('text_day'),
                        'week' => $this->language->get('text_week'),
                        'semi_month' => $this->language->get('text_semi_month'),
                        'month' => $this->language->get('text_month'),
                        'year' => $this->language->get('text_year'),
                    );

                    if ($product['recurring_trial']) {
                        $recurring_price = $this->tax->calculate($product['recurring_trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')); // $this->currency->format($this->tax->calculate($product['recurring_trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')));
                        $profile_description = sprintf($this->language->get('text_trial_description'), $recurring_price, $product['recurring_trial_cycle'], $frequencies[$product['recurring_trial_frequency']], $product['recurring_trial_duration']) . ' ';
                    }

                    $recurring_price = $this->tax->calculate($product['recurring_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')); // $this->currency->format($this->tax->calculate($product['recurring_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')));

                    if ($product['recurring_duration']) {
                        $profile_description .= sprintf($this->language->get('text_payment_description'), $recurring_price, $product['recurring_cycle'], $frequencies[$product['recurring_frequency']], $product['recurring_duration']);
                    } else {
                        $profile_description .= sprintf($this->language->get('text_payment_until_canceled_description'), $recurring_price, $product['recurring_cycle'], $frequencies[$product['recurring_frequency']], $product['recurring_duration']);
                    }
                }

                $this->load->model('catalog/product');
                $product_info = $this->model_catalog_product->getProduct($product['product_id']);

                if (!empty($this->data['isGSTAllowed'])) {
                    $GSTPercentTax = array();
                   // $totalUnitPrice = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
				    $totalUnitPrice = ($product['price'] * $product['quantity']);
                    $this->load->model('localisation/tax_class');
                    $this->load->model('localisation/tax_rate');
                    $getTaxClasses = $this->model_localisation_tax_class->getTaxClasses();
                    $getTaxClassesRates = $this->model_localisation_tax_rate->getTaxRates();
                    foreach ($getTaxClasses as $value) {
                        if (strstr($value['title'], '12'))
                            $value['title'] = 12;
                        elseif (strstr($value['title'], '18'))
                            $value['title'] = 18;
						elseif (strstr($value['title'], '5'))
                            $value['title'] = 5;
                        elseif (strstr($value['title'], '28'))
                            $value['title'] = 28;

                        $GSTPercentTax[$value['tax_class_id']]['title'] = $value['title'];
                        $getTaxClasses = $this->model_localisation_tax_class->getTaxRules($value['tax_class_id']);
                        foreach ($getTaxClassesRates as $values) {
                            if ($getTaxClasses[0]['tax_rate_id'] == $values['tax_rate_id']) {
                                $GSTPercentTax[$value['tax_class_id']]['rate'] = $values['rate'];
//                            echo (($totalUnitPrice * $values['rate'])/100); die;
//                            $totalPrice = $totalUnitPrice + (($totalUnitPrice * $values['rate'])/100);
                                $GSTPercentTax[$value['tax_class_id']]['amount'] = ($totalUnitPrice * $values['rate']) / 100;
                            }
                        }
                    }
                    $totalPrice = $totalUnitPrice + $GSTPercentTax[$product_info['tax_class_id']]['amount']; // $this->currency->format($totalUnitPrice + $GSTPercentTax[$product_info['tax_class_id']]['amount']);
                    $GSTPercentTax[$product_info['tax_class_id']]['amount'] = ($GSTPercentTax[$product_info['tax_class_id']]['amount']);
                }
 
                $this->data['products'][] = array(
                    'key' => $product['key'],
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
					'before_discount_price' => $product['before_discount_price'],
					'before_discount_total' => $product['before_discount_total'],
					'discount_percentage' => $product['discount_percentage'],
					'price_simple' =>  $product['price'] ,
					'total_simple' =>  ($product['price'] * $product['quantity']),
                    'price' => $this->currency->format($product['price']) ,// $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), // $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
                    'total' => $this->currency->format( $product['price'] * $product['quantity']),//($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']), // $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
                    'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
                    'recurring' => $product['recurring'],
                    'profile_name' => $product['profile_name'],
                    'profile_description' => $profile_description,
					'is_sample_sale' =>$product['is_sample_sale'],
					'parent_category_id' =>$product['parent_category_id'],
                    'isbn' => $product_info['isbn'],
                    'tax_class_id' => $product_info['tax_class_id'],
                    'tax_class_title' => (isset($GSTPercentTax[$product_info['tax_class_id']])) ? $GSTPercentTax[$product_info['tax_class_id']]['title'] : '-',
                    'tax_class_rate' => (isset($GSTPercentTax[$product_info['tax_class_id']])) ? $GSTPercentTax[$product_info['tax_class_id']]['rate'] : '0',
                    'tax_class_amount' => (isset($GSTPercentTax[$product_info['tax_class_id']])) ? $GSTPercentTax[$product_info['tax_class_id']]['amount'] : '0',
					'tax_class_amount_simple' => (isset($GSTPercentTax[$product_info['tax_class_id']])) ? $GSTPercentTax[$product_info['tax_class_id']]['amount'] : '0',
                    'total_price' => $this->currency->format($totalPrice),
					'total_price_simple' => $totalPrice
                );
            }

            // Gift Voucher
            $this->data['vouchers'] = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $voucher) {
                    $this->data['vouchers'][] = array(
                        'description' => $voucher['description'],
                        'amount' => $voucher['amount'], // $this->currency->format($voucher['amount'])
                    );
                }
            }

            $this->data['totals'] = $total_data_org;
			 $this->data['totals_display'] = $total_data;

            $this->data['payment'] = $this->getChild('payment/' . $this->session->data['payment_method']['code']);
        } else {
            $this->data['redirect'] = $redirect;
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/confirm.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/confirm.tpl';
        } else {
            $this->template = 'default/template/checkout/confirm.tpl';
        }

        $this->response->setOutput($this->render());
    }

}

?>