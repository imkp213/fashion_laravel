<?php

namespace App\Traits;
use Illuminate\Support\Facades\Crypt;

trait CommonFunctions
{
	function get_encrypted_value($key, $encrypt = false)
    {

        $encrypted_key = null;
        if (!empty($key))
        {
            if ($encrypt == true)
            {
                $key = Crypt::encrypt($key);
            }
            $encrypted_key = $key;
        }
        return $encrypted_key;
    }

    function get_decrypted_value($key, $decrypt = false)
    {
        $decrypted_key = null;
        if (!empty($key))
        {
            if ($decrypt == true)
            {
                $key = Crypt::decrypt($key);
            }
            $decrypted_key = $key;
        }
        return $decrypted_key;
    }


    function p($p, $exit = 1)
    {
        echo '<pre>';
        print_r($p);
        echo '</pre>';
        if ($exit == 1){
            exit;
        }
    }
}   

?>