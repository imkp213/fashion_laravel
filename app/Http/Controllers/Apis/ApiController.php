<?php

namespace App\Http\Controllers\Apis;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\WebUsers;
use App\Model\Cart;
use App\Model\Products;
use App\Model\Orders;
use Hash;
use App\Traits\CommonFunctions;

class ApiController extends Controller
{
	use CommonFunctions;

	public function get_all_products()
	{
		$products = Products::where('status',1)->paginate(8)->toArray();
		
		if (!empty($products)){
			
			$products['prev_page_url'] = !empty($products['prev_page_url']) ? $products['prev_page_url'] : "";
			$products['next_page_url'] = !empty($products['next_page_url']) ? $products['next_page_url'] : "";
			
			$response['status'] 	= true;
			$response['message'] 	= trans('message.success_msg');
		
		}else{
			$response['status'] 	= false;
			$response['message'] 	= trans('message.not_found_msg');
		}

		$response['data'] 		= !empty($products) ? $products : [];
		return response()->json($response,200);
	}

    public function register(Request $request)
	{
		$response 			= [];

	    $name				= $request->input('name');
	    $email				= $request->input('email');
	    $password			= $request->input('password');
	    
	    if(!empty($request->input())){
	    	
	    	if(!empty($name) && !empty($email) && !empty($password)){

	    		$user_check = WebUsers::where('email',$email)->first();

	    		if(!empty($user_check)){
	    			$status 		= false;
	    			$message 		= 'Email Address is aleady used';
	    		}else{

	    			$user = new WebUsers;
	    			$user->name 		= $name;
	    			$user->email 		= $email;
	    			$user->password		= Hash::make($password);
	    			$user->save();

	    			$status 		= true; 
	    			$message 		= 'User inserted Successfully';
	    		}
	    	}else{
	    		$status 		= false; 
	    		$message 		= 'Parameters missmatch';
	    	}
	    }else{
	    	$status 		= false; 
	    	$message 		= 'Parameters missing';
	    }

	    $response['status']  	= $status;
	    $response['message'] 	= $message;

	    return response()->json($response, 200);
	}


	public function login(Request $request)
	{
		$result_data 	= [];
	    $email			= $request->input('email');
	    $password		= $request->input('password');    	

	    if(!empty($request->input())){

	    	if(!empty($email) && !empty($password)){

	    		$user = WebUsers::where('email',$email)->first();

	    		if(!empty($user)){

	    			if(Hash::check($password, $user->password)){
	    				$result_data['user'] = array(
	    					'id'	=> $this->get_encrypted_value($user->user_id,true),
	    					'name'	=> $user->name,
	    					'email'	=> $user->email,
	    				);
	    				$status 		= true;
	    				$message 		= 'record found';
	    			}else{
	    				$status 		= false; 
	    				$message 		= 'invalid password';
	    			}
	    		}else{
	    			$status 		= false; 
	    			$message 		= 'invalid username';
	    		}

	    	}else{

	    		$status 		= false; 
	    		$message 		= 'parameters missmatch';
	    	}

	    }else{
	    	$status 		= false; 
	    	$message 		= 'parameters missing';
	    }

	    $response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;
	    return response()->json($response, 200);
	}

	public function user_details($user_id)
	{
		$result_data = [];

		if (!empty($user_id)) {
			$userId 	= $this->get_decrypted_value($user_id,true);

			$userCheck = WebUsers::find($userId);
			if (!empty($userCheck)){
				$status 			= true;
				$message 			= "user details found";
				
				$result_data['user']= array(
					'id'	=> $this->get_encrypted_value($userCheck->user_id,true),
					'name'	=> $userCheck->name,
					'email'	=> $userCheck->email,
				);

			}else{
				$status 	= false;
				$message 	= "user not found";
			}
		}else{
			$status 	= false;
			$message 	= "parameters missing"; 
		}

		$response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;
	    return response()->json($response, 200);
	}


	public function add_to_cart(Request $request)
	{
		$result_data 	= [];
	    $product_id		= $request->input('product_id');
	    $qty			= $request->input('qty');
	    $user_id 		= $request->input('user_id');
		
		$userId = $this->get_decrypted_value($user_id,true);

		if (!empty($product_id) && !empty($userId) && $userId != null ){
			
			$product 	= Products::find($product_id);
			$cartCheck 	= Cart::where(['cart_pro_id'=>$product_id,'cart_user_id'=>$userId])->first();

			if (!empty($cartCheck)){
				$oldCart 			= Cart::find($cartCheck->cart_id);
				$oldCart->cart_qty	= !empty($qty) ? $qty : $oldCart->cart_qty+1 ;
				$oldCart->save();

				$message = "cart updated successfully";

			}else{
				$newCart 				= new Cart;
				$newCart->cart_pro_id	= $product_id;
				$newCart->cart_user_id	= $userId;
				$newCart->cart_qty		= !empty($qty) ? $qty : 1;
				$newCart->cart_price	= $product->pro_price;
				$newCart->save();

				$message = "added to cart successfully";
			}
			$status 	= true;
		
		}else{

			$status 	= false;
			$message	= "parameters missing or missmatch";
		}

		
		$response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;

		return response()->json($response,200);
	}


	public function delete_cart($cart_id)
	{
		$result_data = [];
		if (!empty($cart_id)) {
			$cart 			= Cart::find($cart_id);
			if (!empty($cart)) {

				$cart->delete();
				
				$status 	= true;
				$message	= "cart's product deleted successfully";
			}else{
				$status 	= false;
				$message	= "data not found";	
			}
		}else{
			$status 	= false;
			$message	= "parameters missing or missmatch";
		}

		$response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;

		return response()->json($response,200);
	}


	public function get_cart_products($user_id)
	{
		// dd($request);
		$result_data 	= [];
		$userId 		= $this->get_decrypted_value($user_id,true);
		
		if ($userId!=null && !empty($userId) ) {
			
			$carts = Cart::where('cart_user_id',$userId)
						->join('fashion_products','fashion_carts.cart_pro_id','=','fashion_products.pro_id')
						->select('cart_id','cart_pro_id','cart_qty','pro_name','pro_slug','cart_price','pro_image')
						->get()->toArray();

			if (!empty($carts)) {
				$result_data 	= $carts;
				$status 		= true;
				$message		= "data found";
			}else{
				$status 		= false;
				$message		= "data not found";
			}

		}else{
			$status 	= false;
			$message	= "parameters missing or missmatch";
		}

		$response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;

		return response()->json($response,200);
	}


	public function product_details($slug)
	{
		$result_data 	= [];
		if (!empty($slug)) {
			$productCheck = Products::where('pro_slug',$slug)->first();
			
			if (!empty($productCheck)){
				$product 	= Products::where('pro_id',$productCheck->pro_id)
								->with('getImages')
								->first()
								->toArray();

				$result_data=$product;
				$status 	= true;
				$message	= "data found";
			}else{
				$status 	= false;
				$message	= "parameters missmatch";
			}

		}else{
			$status 	= false;
			$message	= "parameters missing";
		}

		$response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;

		return response()->json($response,200);
	}


	public function check_out(Request $request)
	{
		$result_data 	= [];
		$userId 		= $this->get_decrypted_value($request->input('user_id'),true);
		if ($userId) {
			$carts = Cart::where('cart_user_id',$userId)
						->join('fashion_products','fashion_carts.cart_pro_id','=','fashion_products.pro_id')
						->select('cart_id','cart_pro_id','cart_qty','pro_name','pro_slug','cart_price','pro_image')
						->get()->toArray();
			$totalPay =0;
			$totalQty =0;
			foreach ($carts as $cart) {
				
				$totalPay += $cart['cart_qty']*$cart['cart_price'];
				$totalQty += $cart['cart_qty'];
			}

			$order 					= new Orders;
			$order->order_carts 	= json_encode($carts,true);
			$order->order_user_id	= $userId;
			$order->order_total_qty = $totalQty;
			$order->order_paymnt_amount	= $totalPay;
			$order->save();

			Cart::where('cart_user_id',$userId)->delete();			

			$result_data 	= $order;
			$status 		= true;
		    $message		= "buy success";
		
		}else{
			$status 	= false;
			$message	= "parameters missing";
		}

		$response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;
		return response()->json($response,200);
	}

	public function user_orders($user_id)
	{
		$result_data 	= [];
		$userId 		= $this->get_decrypted_value($user_id,true);
		
		if (!empty($userId)){
			
			$orders = Orders::where('order_user_id',$userId)->get();
			
			foreach ($orders as $order) {
				$data[] = array(
					'order_id'		=> 'FHCUBE-00'.$order->order_id,
					'total_amount'	=> $order->order_paymnt_amount,
					'total_qty'		=> $order->order_total_qty,
					'carts'			=> json_decode($order->order_carts)
				);
			}

			if(!empty($data)){
				$result_data= $data;
				$status 	= true;
				$message	= "data found";
			}else{
				$status 	= false;
				$message	= "no data";		
			}
		}else{
			$status 	= false;
			$message	= "parameters missing";
		}

		$response['data']    	= $result_data;
	    $response['status']  	= $status;
	    $response['message'] 	= $message;
		return response()->json($response,200);
	}
}
