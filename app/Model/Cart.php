<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $table 		= "fashion_carts";
	protected $primaryKey 	= "cart_id";
}
