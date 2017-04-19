<?php

include 'includes/styles.html';

require_once 'core/init.php';

$user= new user();
if(!($user->isLoggedIn() && $user->data()->group== 3))
{
	Redirect::to('login.php');
}
?>
<?php
if(Input::exists('post'))
{	
	$supemail=Input::get('email');
	$db=DB::getInstance();
	$sup=$db->get('supplier',array('e_mail','=',$supemail));
	$supid=$sup->results()[0]->supid;
	$pid=Input::get('pid');
	$pname=Input::get('pname');
	$cost=Input::get('cost');
	$category=Input::get('category');
	$brand=Input::get('brand');
	$units=Input::get('quantity');
	$pid=Input::get('pid');
	$dop=Input::get('dop');

	$db=DB::getInstance();
	$search=$db->get('product',array('pid','=',$pid));
	$count=$search->count();
	if($count>0)
	{
		$db=DB::getInstance();
		$units_available=$db->query('update product set units_avail = units_avail + '.$units.' where pid = '.$pid.';');	
	}
	else
	{
		$db=DB::getInstance();
		$product=$db->insert('product',array(
			'pid'=>$pid,
			'pname'=>$pname,
			'cost'=>$cost,
			'category'=>$category,
			'brand'=>$brand,
			'units_avail'=>$units
		));

	}

	$db=DB::getInstance();
	$purchases=$db->insert('purchases',array(
		'supid'=>$supid,
		'pid'=>$pid,
		'dop'=>$dop,
		'quantity'=>$units,
		'cost_item'=>$cost
		));

	
	echo "<script>alert('Data inserted successfully !')</script>";

	// Redirect::to('inventory_manager.php');

}
?>

<style>
.container {
    padding: 20px;
    width: 40%;
}

.container form {
    border: 2px solid gray;
    padding: 50px;
}
</style>

<div class="jumbotron text-center">
    <h1>Inventory Manager</h1>
</div>

<div class="container">
	<p><a href="logout.php">Logout</a></p><br>


	<form action="" method="post">
		<label>Enter the information about Supplier:</label>
		<br><br>
		
		<div class="form-group">
			<label for="email">Supplier Email</label>
			<input type="email" class="form-control" name="email" minlength="4" maxlength="20">
		</div>

		<br><br>

		<label>Enter the information about the product:</label>
		<br><br>
		
		<div class="form-group">
			<label>Product ID</label>
			<input type="number" class="form-control" name="pid" id='pid' minlength="1" maxlength="10">
		</div>
		<div class="form-group">
			<label>Product Name</label>
			<input type="text" class="form-control" name="pname" id='pname' minlength="4" maxlength="20">
		</div>
		<div class="form-group">
			<label>Product Category</label>
			<input type="text" class="form-control" name="category" id='category' minlength="4" maxlength="20">
		</div>
		<div class="form-group">
			<label>Brand of product</label>
			<input type="text" class="form-control" name="brand" id='brand' minlength="4" maxlength="20">
		</div>
		<div class="form-group">
			<label>Quantity</label>
			<input type="number" class="form-control" name="quantity" id='quantity' minlength="1" maxlength="10">
		</div>
		<div class="form-group">
			<label>Date of purchase</label>
			<input type="date" class="form-control" name="dop" id='dop'>
		</div>
		<div class="form-group">
			<label>Cost of each unit</label>
			<input type="number" class="form-control" name="cost" id='cost' minlength="1" maxlength="10">
		</div>

		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>