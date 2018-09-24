<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
class ControllerCustomiseProduct extends Controller {

    public function index() {

//        $this->language->load('customise/product');
//
//        $this->load->model('customise/product');
//
//        $this->load->model('catalog/product');
//
//        $this->load->model('tool/image');
//
//       
//        $this->data['breadcrumbs'] = array();
//
//
//        $this->data['breadcrumbs'][] = array(
//            'text' => $this->language->get('text_home'),
//            'href' => $this->url->link('common/home'),
//            'separator' => false
//        );
//      
//
//        // COLLECT PRODUCT INFO FROM GET REQUEST
//        
//        $this->load->model('catalog/mindfull');
//        
//        if (isset($this->request->get['product_id'])) {
//                $product_info =  $this->model_catalog_mindfull->getProduct($this->request->get['product_id']);
//            }
//           
//        if ($product_info) {
//
//            $this->document->setTitle($product_info['name']);
//            $this->document->setDescription($product_info['meta_description']);
//            $this->document->setKeywords($product_info['meta_keyword']);
//            $this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
//
//             
//            $this->data['discription'] = $product_info['meta_description']; 
//            $this->data['heading_title'] = $product_info['name'];
//            $cat_image = $this->model_tool_image->resize($product_info['image'], 847, 291);
//            $this->data['category_image'] = $cat_image;
//            $this->data['category_main_id'] = $category_id;
//            $this->data['text_refine'] = $this->language->get('text_refine');
//            $this->data['text_empty'] = $this->language->get('text_empty');
//            $this->data['text_quantity'] = $this->language->get('text_quantity');
//            $this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
//            $this->data['text_model'] = $this->language->get('text_model');
//            $this->data['text_price'] = $this->language->get('text_price');
//            $this->data['text_tax'] = $this->language->get('text_tax');
//            $this->data['text_points'] = $this->language->get('text_points');
//            $this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
//            $this->data['text_display'] = $this->language->get('text_display');
//            $this->data['text_list'] = $this->language->get('text_list');
//            $this->data['text_grid'] = $this->language->get('text_grid');
//            $this->data['text_sort'] = $this->language->get('text_sort');
//            $this->data['text_limit'] = $this->language->get('text_limit');
//
//            $this->data['button_cart'] = $this->language->get('button_cart');
//            $this->data['button_wishlist'] = $this->language->get('button_wishlist');
//            $this->data['button_compare'] = $this->language->get('button_compare');
//            $this->data['button_continue'] = $this->language->get('button_continue');
//
//        
//
//            if ($product_info['image']) {
//                $this->data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
//            } else {
//                $this->data['thumb'] = '';
//            }
//
//            $this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
//            $this->data['compare'] = $this->url->link('product/compare');
//
//             if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customise/product.tpl')) {
//                $this->template = $this->config->get('config_template') . '/template/customise/product.tpl';
//            } else {
//                $this->template = 'default/template/customise/product.tpl';
//            }
//
//           $this->data['breadcrumbs'][] = array(
//                'text' => 'Mindfull Gift',
//                'href' => $this->url->link('product/mindfull'),
//                'separator' => $this->language->get('text_separator')
//            );   
//            //customise/product&product_id=2408&shapre=rectangle&category=trays
//             $this->data['breadcrumbs'][] = array(
//                'text' => $product_info['name'],
//                'href' => $this->url->link('customise/product&product_id='. $product_info['product_id'] . '&shapre=' . $this->request->get['shapre'] . '&category='. $this->request->get['category']),
//                'separator' => $this->language->get('text_separator')
//            );   
//            
//            
//            $this->children = array(
//                'common/column_left',
//                'common/column_right',
//                'common/content_top',
//                'common/content_bottom',
//                'common/footer',
//                'common/header'
//            );
//
//            $this->response->setOutput($this->render());
//        } else {
//
//            $url = '';
//
//            if (isset($this->request->get['path'])) {
//                $url .= '&path=' . $this->request->get['path'];
//            }
//
//            if (isset($this->request->get['filter'])) {
//                $url .= '&filter=' . $this->request->get['filter'];
//            }
//
//            if (isset($this->request->get['sort'])) {
//                $url .= '&sort=' . $this->request->get['sort'];
//            }
//
//            if (isset($this->request->get['order'])) {
//                $url .= '&order=' . $this->request->get['order'];
//            }
//
//            if (isset($this->request->get['page'])) {
//                $url .= '&page=' . $this->request->get['page'];
//            }
//
//            if (isset($this->request->get['limit'])) {
//                $url .= '&limit=' . $this->request->get['limit'];
//            }
//
//            $this->data['breadcrumbs'][] = array(
//                'text' => $this->language->get('text_error'),
//                'href' => $this->url->link('product/category', $url),
//                'separator' => $this->language->get('text_separator')
//            );
//
//            $this->document->setTitle($this->language->get('text_error'));
//
//            $this->data['heading_title'] = $this->language->get('text_error');
//
//            $this->data['text_error'] = $this->language->get('text_error');
//
//            $this->data['button_continue'] = $this->language->get('button_continue');
//
//            $this->data['continue'] = $this->url->link('common/home');
//
//            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');
//           
//            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
//                $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
//            } else {
//                $this->template = 'default/template/error/not_found.tpl';
//            }
//
//            $this->children = array(
//                'common/column_left',
//                'common/column_right',
//                'common/content_top',
//                'common/content_bottom',
//                'common/footer',
//                'common/header'
//            );
//
//            $this->response->setOutput($this->render());
//        }
        
        
        
        
		$this->language->load('product/product');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $path),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
			$this->data['category_id']= $category_id;
			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$this->data['breadcrumbs'][] = array(
					'text'      => $category_info['name'],
					'href'      => $this->url->link('product/category', 'path=' . $this->request->get['path'].$url),
					'separator' => $this->language->get('text_separator')
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url),
					'separator' => $this->language->get('text_separator')
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('product/search', $url),
				'separator' => $this->language->get('text_separator')
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$product_category =  $this->model_catalog_product->getCategories($product_id);
		$product_category  = array_reverse($product_category);
 		$this->data['category_id']= $product_category[0]['category_id'];

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name'],
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');

			$this->data['heading_title'] = $product_info['name'];

			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');

			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');

			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_upload'] = $this->language->get('button_upload');
			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
			$this->data['tab_related'] = $this->language->get('tab_related');

			$this->data['product_id'] = $this->request->get['product_id'];
			$this->data['manufacturer'] = $product_info['manufacturer'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$this->data['model'] = $product_info['model'];
			$this->data['location'] = $product_info['location'];
			$this->data['reward'] = $product_info['reward'];
			$this->data['points'] = $product_info['points'];

			if ($product_info['quantity'] <= 0) {
				$this->data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $product_info['quantity'];
			} else {
				$this->data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$this->data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = '';
			}

			if ($product_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = '';
			}

			$this->data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
				);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$this->data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['price'] = false;
			}

			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$this->data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$this->data['discounts'] = array();

			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}

			$this->data['options'] = array();
 
			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();

					foreach ($option['option_value'] as $option_value) {
	
						
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								if($option_value['addpercentage']){
								$price = $this->currency->format($this->tax->calculate(($option_value['addpercentage']*$product_info['price'])/100, $product_info['tax_class_id'], $this->config->get('config_tax')));
								}else {
									
									$price='';
								}
							} else {
								$price = false;
							}

                                                        $explodeName = explode("-", $option_value['name']);
                                                        
							$option_value_data[] = array(
							
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $explodeName[0], //$option_value['name'],
								'borderColor'             => trim($explodeName[1]),
								'designSKU'             => trim($explodeName[1]),
								'fullImage'               => $option_value['image'],
								'image'                   => $this->model_tool_image->resize($option_value['image'], 25, 25),
								'price'                   => $price,
								'color_code'              => $option_value['color_code'],
								'design_desc'             => $option_value['design_desc'],
								'price_prefix'            => $option_value['price_prefix']
							);
						}
					}

					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
                   
			if ($product_info['minimum']) {
				$this->data['minimum'] = $product_info['minimum'];
			} else {
				$this->data['minimum'] = 1;
			}

			$this->data['review_status'] = $this->config->get('config_review_status');
			$this->data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$this->data['rating'] = (int)$product_info['rating'];
			$this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$this->data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				
				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
 					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'location'    => $result['location'],
					'model'    	  => $result['model'],
					'price'   	 => $price,
					
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$this->data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$this->data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');
			$this->data['profiles'] = $this->model_catalog_product->getProfiles($product_info['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
			
			
                    // ---------------------------- COSTER WORK [START]----------------------------@rahul
                        if(isset($_GET['category']) && !empty($_GET['category'])){
                            $defaultTemplate = 'default/template/customise/product.tpl';
                            
                            if($_GET['category'] =='Trays')
                                    $defaultTemplate = '/template/customise/product.tpl';
                            if($_GET['category'] =='Coasters')
                                    $defaultTemplate = '/template/customise/coaster.tpl';
                            
                            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $defaultTemplate)) {
                                $this->template = $this->config->get('config_template') . $defaultTemplate;
                            }else{
                                $this->template = 'default/template/customise/product.tpl';
                            }
                        }else {
				$this->template = 'default/template/customise/product.tpl';
			} 
//                    // ---------------------------- COSTER WORK [END]----------------------------@rahul
//                    
//                    
//			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customise/product.tpl')) {
//				$this->template = $this->config->get('config_template') . '/template/customise/product.tpl';
//			} else {
//				$this->template = 'default/template/customise/product.tpl';
//			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
		}

        
        
        
        
        
    }
	 public function validate() {
		 	$this->load->model('customise/product');

		if (isset($this->request->post['rcode']) && !empty($this->request->post['rcode'])) {
		 
			$results = $this->model_customise_product->getCode($this->request->post['rcode']);
			//echo '<pre>';print_r($results);
			if(trim($results['reference_code'])==trim($this->request->post['rcode']))
			echo 'success';
			else
			echo 'invalid';
		}
		 
	 }

}

?>