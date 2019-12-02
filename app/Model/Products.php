<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
	protected $table 		= "fashion_products";
	protected $primaryKey 	= "pro_id";

	public function getImages()
	{
		return $this->hasMany('App\Model\Products_Images','pro_id');
	}
}
