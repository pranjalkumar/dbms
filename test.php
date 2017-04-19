<?php

require_once 'core/init.php';

if(Input::exists('get'))
{	

	
	$total_cost=Input::get('quantity')*Input::get('cost');
	$date= date('Y-m-d H:i:s');
	$units=Input::get('quantity');
	$quantity=$units;
	$pid=Input::get('pid');
	$cost=Input::get('cost');
	$name=Input::get('name');
	$contact=Input::get('contact');
	$addr=Input::get('addr');
	$email=Input::get('email');
	$num=$contact*3325637;
	$sid=substr($num,9);
	
	// $db=DB::getInstance();
	
	// 	$customer=$db->insert('customer',array(
	// 	'name'=>$name,
	// 	'phone'=>$contact,
	// 	'address'=>$addr,
	// 	'e_mail'=>$email,
	// 	));

	$db=DB::getInstance();
	$search= $db->get('customer',array('phone','=',$contact));
	$count=$search->count();
	if($count==0)
	{	

		$db=DB::getInstance();
		$customer=$db->insert('customer',array(
		'phone'=>$contact,
		'name'=>$name,
		'email'=>$email,
		'address'=>$addr
		));	
	}

	$db=DB::getInstance();
	$pr_search=$db->get('product',array('pid','=',$pid));
	$pr_count=$pr_search->count();
	if($pr_count==0)
	{	die("Sorry!! Selected product is not available");
	}
	else{
			if($pr_search->results()[0]->units_avail < $units)
				{
					die("Sorry!! The numbers of quantity selected is not available");
				}
			else {

				$db=DB::getInstance();
				$units_available=$db->query('update product set units_avail = units_avail - '.$units.' where pid = '.$pid.';');	
										echo $pid;echo $date;echo $quantity;echo $cost;echo $sid;
										$sales= $db->insert('sales',array(
								'pid'=>$pid,
								'date_sale'=>$date,
								'quantity'=>$quantity,
								'cost'=>$cost,
								'sid'=>$sid
								));	

	
	
	
	
							$transaction= $db->insert('trans',array(
								'sid'=>$sid,
								'phone'=>$contact,
								'total_cost'=>$total_cost		
								));
			}	
	}


		Redirect::to('inventory_manager.php');
		

	
	// $units_available=$db->query('update product set units_avail = units_avail -'.$units.'where pid ='.$pid);
	// // Redirect::to('sales_employee.php');
	// echo $name;
	// echo $email;
	// echo $contact;
	// echo $addr;
	// echo $pid;
	// echo $sid;
	// echo $date;
	// echo $units;
	

	
}
