<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
	protected $table 		= "fashion_orders";
	protected $primaryKey 	= "order_id";
}
