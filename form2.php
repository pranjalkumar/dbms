<?php
require_once 'core/init.php';

if(Input::exists('post'))
{
	$user = new User();
    $salt = Hash::salt(32);

    try {
        $user->create(array(
            'name' => Input::get('name'),
            'username' => Input::get('username'),
            'password' => Hash::make(Input::get('pass'), $salt),
            'salt' => $salt,
            'group' => 3
        ));
    }catch (Exception $e){die($e->getMessage());}
}