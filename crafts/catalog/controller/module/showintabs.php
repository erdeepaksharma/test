<?php  
class ControllerModuleShowintabs extends Controller {
	protected function index($setting) {
    	$this->load->language('module/showintabs');
    	$this->load->model('catalog/product');

		$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
    	
    	//Obetenemos datos de las pestañas
    	$tabs = $this->config->get('showintabs_tab');

    	$this->data['module_number'] = $setting['module_row'];

    	//preparamos pestañas de este modulo
    	$this->data['tabs'] = array();

		$this->load->model('tool/image');

		$tabs_module = isset($setting['tabs']) ? $setting['tabs'] : array();

    	foreach ($tabs_module as $keyTab ) {

	    	//Title de la pestaña
			if ( isset($tabs[$keyTab]['title'][$this->config->get('config_language_id')]) && !empty($tabs[$keyTab]['title'][$this->config->get('config_language_id')])) {
				$this->data['tabs'][$keyTab]['title'] = $tabs[$keyTab]['title'][$this->config->get('config_language_id')];
			}else{
				$this->data['tabs'][$keyTab]['title']  = $this->language->get('heading_default');
			}
			
		
			$this->data['carousel'] = $setting['carousel'];
			$this->data['columns'] = $setting['columns'];
			
			

			//Productos de la pestaña
			$products = array();

			switch ($tabs[$keyTab]['data_source']) {
				case 'SP': //Select Products
					$results = $this->getSelectProducts($tabs[$keyTab],$setting['limit']);
					break;
				case 'PG': //Product Group
					$results = $this->getProductGroups($tabs[$keyTab],$setting['limit']);
					break;
				case 'CQ': //Custom Query
					$results = $this->getCustomQuery($tabs[$keyTab],$setting['limit']);
					break;
				default:
					$this->log->write('SHOW_IN_TAB::ERROR: The tab don\'t have product configured.');
					break;
			}
			
			

			//Preparo la info de cada producto
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}
				
				// Cosyone custom code starts	
			   $images = $this->model_catalog_product->getProductImages($result['product_id']);
            if(isset($images[0]['image']) && !empty($images[0]['image'])){
                  $images = $images[0]['image'];
				 } else {
					$images = false;
				}
			  // Cosyone custom code ends
			  
			  
				 
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
				
				// Cosyone custom code starts	
			  if ((float)$result['special']) {
				$sales_percantage = ((($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'))))/(($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))/100));
				} else {
				$sales_percantage = false;
				}
			  // Cosyone custom code ends
				
				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
					//	echo '<pre>';
					//	print_r($result)	;// die;	
					if($result['is_sample_sale']==1)
						continue;
					
				$products[] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'thumb_hover'  => $this->model_tool_image->resize($images, $setting['image_width'], $setting['image_height']),
					'name'    	 => $result['name'],
					'location'    	 => $result['location'],
					'model'    	 => $result['model'],
					'brand_name' => $result['manufacturer'],
					'price'   	 => $price,
					'special' 	 => $special,
					'sales_percantage' => number_format($sales_percantage, 0, ',', '.'),
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'quickview'  => $this->url->link('product/quickview', 'product_id=' . $result['product_id']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}	

			$this->data['tabs'][$keyTab]['products'] = $products;
			
    	}

    	$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/showintabs.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/showintabs.tpl';
		} else {
			$this->template = 'default/template/module/showintabs.tpl';
		}
		
		$this->render();
  	}

  	// Obtiene los productos de los grupos predefinidos de opencart
  	private function getProductGroups( $tabInfo , $limit ){
  		$results = array();

  		//Obtengo listado de productos en funcion del criterio
  		switch ( $tabInfo['product_group'] ) {
			
			
			
  			case 'BS':
  				$results = $this->model_catalog_product->getBestSellerProducts($limit);
  				break;
  			case 'LA':
  				$results = $this->model_catalog_product->getLatestProducts($limit);
  				break;
  			case 'SP':
  				$results = $this->model_catalog_product->getProductSpecials(array('start' => 0,'limit' => $limit));
  				break;
  			case 'PP':
  				$results = $this->model_catalog_product->getPopularProducts($limit);
  				break;
			case 'PPP':
  				$results = $this->model_catalog_product->getPastPurchashedProducts($limit);
  				break;
  		}

  		return $results;
  	}

	// Obtiene los productos seleccionados por el user con toda la info necesaria
  	private function getSelectProducts( $tabInfo , $limit ){ 
  		$results = array();

  		if(isset($tabInfo['products'])){
  			$limit_count = 0;
			foreach ( $tabInfo['products'] as $product ) {
				if ($limit_count++ == $limit) break;
				$results[$product['product_id']] = $this->model_catalog_product->getProduct($product['product_id']);
			}
		}

		return $results;
  	}

  	//Obtiene los productos segun los datos del custom query
  	private function getCustomQuery( $tabInfo , $limit){
  		$results = array();

  		if ( $tabInfo['sort'] == 'rating' || $tabInfo['sort'] == 'p.date_modified') {
  			$order = 'DESC';
  		}else{
  			$order = 'ASC';
  		}

  		$data = array(
  			'filter_category_id' => $tabInfo['filter_category']=='ALL' ? '' : $tabInfo['filter_category'], 
  			'filter_manufacturer_id' => $tabInfo['filter_manufacturer']=='ALL' ? '' : $tabInfo['filter_manufacturer'], 
  			'sort' => $tabInfo['sort'], 
  			'order' => $order,
  			'start' => 0,
  			'limit' => $limit
  		);

  		$results = $this->model_catalog_product->getProducts($data);

		return $results;
  	}

}
?>