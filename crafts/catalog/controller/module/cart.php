<?php 

class ControllerModuleCart extends Controller {

	public function index() {

		$this->language->load('module/cart');



		if (isset($this->request->get['remove'])) {

			$this->cart->remove($this->request->get['remove']);



			unset($this->session->data['vouchers'][$this->request->get['remove']]);

		}



		// Totals

		$this->load->model('setting/extension');



		$total_data = array();					

		$total = 0;

		$taxes = $this->cart->getTaxes();



		// Display prices

		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {

			$sort_order = array(); 



			$results = $this->model_setting_extension->getExtensions('total');


			foreach ($results as $key => $value) {

				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');

			}



			array_multisort($sort_order, SORT_ASC, $results);




			foreach ($results as $result) {

				if ($this->config->get($result['code'] . '_status')) {
							if($result['code'] == 'freight')
                            continue;
							//if($result['code'] == 'discount')
                           //  continue;
							
					$this->load->model('total/' . $result['code']);



					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);

				}



				$sort_order = array(); 



				foreach ($total_data as $key => $value) {

					$sort_order[$key] = $value['sort_order'];

				}



				array_multisort($sort_order, SORT_ASC, $total_data);			

			}		

		}



		$tempTotal_data1 = array();
		$tempTotal_data2 = array();
		$handling_ammt  =0;
		$SAC =0;
		foreach($total_data as $tdata){
	 
			 if($tdata['title']=='Handling Fee')
			 {
				 $handling_ammt = $handling_ammt+$tdata['value'];
 				  $SAC =1;
				  $tempTotal_data2[0]=array(
										'code' => $tdata['code'],
										'title' => 'Handling Fee',
										'text' => $this->currency->format($handling_ammt) ,
										'value' => $handling_ammt,
										'sort_order' => '2'
										);
			 }
			else if($tdata['title']=='SAC'){
				 $handling_ammt = $handling_ammt+$tdata['value'] ;//due to handling charge + sac comes 120.01 and we have to make it 120.00
 				  $SAC =1;
				   $tempTotal_data2[0]=array(
										'code' => 'handling',
										'title' => 'Handling Fee',
										'text' => $this->currency->format($handling_ammt) ,
										'value' =>$handling_ammt,
										'sort_order' => '2'
										);
			 }
 			 else {
				 
				 $tempTotal_data1[] = $tdata; 
			 }
			 
		}
		$total_data= array_merge($tempTotal_data1,$tempTotal_data2);
		$sort_order = array();
		
		foreach ($total_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}
		array_multisort($sort_order, SORT_ASC, $total_data);
				 
				 
			
	/*	 echo '<pre>';
print_r($total_data); die;*/
	 
		
		
		$this->data['totals'] = $total_data;



		$this->data['heading_title'] = $this->language->get('heading_title');



		$this->data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));

		$this->data['text_empty'] = $this->language->get('text_empty');

		$this->data['text_cart'] = $this->language->get('text_cart');

		$this->data['text_checkout'] = $this->language->get('text_checkout');

		$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');



		$this->data['button_remove'] = $this->language->get('button_remove');



		$this->load->model('tool/image');



		$this->data['products'] = array();

			$trade_discount=0;
			$trade_discount_text='';

		foreach ($this->cart->getProducts() as $product) {

			if ($product['image']) {

				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));

			} else {

				$image = '';

			}



			$option_data = array();



			foreach ($product['option'] as $option) {

				if ($option['type'] != 'file') {

					$value = $option['option_value'];	

				} else {

					$filename = $this->encryption->decrypt($option['option_value']);



					$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));

				}				



				$option_data[] = array(								   

					'name'  => $option['name'],

					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),

					'type'  => $option['type']

				);

			}



			// Display prices

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {

				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));

			} else {

				$price = false;

			}



			// Display prices

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {

				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);

			} else {

				$total = false;

			}



			$this->data['products'][] = array(

				'key'       => $product['key'],

				'thumb'     => $image,

				'name'      => $product['name'],

				'model'     => $product['model'], 

				'option'    => $option_data,

				'quantity'  => $product['quantity'],

				'price'     => $price,	

				'before_discount_price'     => $product['before_discount_price'],
				'before_discount_total'     => $product['before_discount_total'],
				'discount_percentage'       => $product['discount_percentage'],
				'parent_category_id'       => $product['parent_category_id'],
				'is_sample_sale'           => $product['is_sample_sale'],

				'total'     => $total,	

				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id']),

				'recurring' => $product['recurring'],

				'profile'   => $product['profile_name'],

			);
			if($product['is_sample_sale']==1){   
					
				 	$trade_discount_text =  $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']; //$totalUnitPrice + $GSTPercentTax[$product_info['tax_class_id']]['amount'];
					$trade_discount= $this->currency->format($trade_discount_text);
 				}
		}
//promo discount
if($this->cart->getTotal()>=3500 &&  $this->cart->getTotal()<= 19999  && $product['is_sample_sale']==1){
	 $total_data[] = array( 
				"code"=>"discount",
				"title"=>"Discount/Gift",
				"text"=>$trade_discount,
				"value"=>$trade_discount_text,
				"sort_order"=>4
				
			 );
			 
}
			$sort_order = array(); 

  				foreach ($total_data as $key => $value) {

					$sort_order[$key] = $value['sort_order'];
 				}
 
				array_multisort($sort_order, SORT_ASC, $total_data);	
				
				
				$this->data['totals'] = $total_data;

		// Gift Voucher

		$this->data['vouchers'] = array();



		if (!empty($this->session->data['vouchers'])) {

			foreach ($this->session->data['vouchers'] as $key => $voucher) {

				$this->data['vouchers'][] = array(

					'key'         => $key,

					'description' => $voucher['description'],

					'amount'      => $this->currency->format($voucher['amount'])

				);

			}

		}



		$this->data['cart'] = $this->url->link('checkout/cart');



		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cart.tpl')) {

			$this->template = $this->config->get('config_template') . '/template/module/cart.tpl';

		} else {

			$this->template = 'default/template/module/cart.tpl';

		}



		$this->response->setOutput($this->render());		

	}

}

?>