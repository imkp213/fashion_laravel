<?php

namespace App\Http\Controllers\Apis;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use App\User;
use JWTFactory;
use JWTAuth;
use Validator;
use Response;
use App\Traits\CommonFunctions;
class UserController extends Controller
{
    use CommonFunctions;
	public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255|unique:users',
            'name' => 'required',
            'password'=> 'required'
        ]);
        if ($validator->fails()) {
            $response['status'] = false;
            $response['message'] = $validator->errors()->first();
            return Response::json($response,200);
        }
        User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => bcrypt($request->get('password')),
        ]);
        $user = User::first();
        $token = JWTAuth::fromUser($user);
        
        $response['data']   = $token;
        $response['status'] = true;
        $response['message'] = "successfully registered with us..!!";
        return Response::json($response,200);
    }


     public function login(Request $request)
    {
        $result_data = [];
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password'=> 'required'
        ]);
        if ($validator->fails()) {

            $response['data']       = $result_data;
            $response['status']     = false;
            $response['message']    = $validator->errors()->first();
            return response()->json($response, 200);
        }
        $credentials = $request->only('email', 'password');
        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                
                $response['data']       = $result_data;
                $response['status']     = false;
                $response['message']    = 'invalid password';
                return response()->json($response, 200);
            }
        } catch (JWTException $e) {

            $response['data']       = $result_data;
            $response['status']     = false;
            $response['message']    = 'could not create token';
            return response()->json($response, 200);
        }

        $user = auth()->user();
        $data = array(
            'name'      => $user->name,
            'email'     => $user->email,
            'password'  => $user->password,
            'id'        => $this->get_encrypted_value($user->id,true)
        );
        $response['data']   = $data;
        $response['token']  = $token;
        $response['status'] = true;
        return Response::json($response,200);
    }
}
