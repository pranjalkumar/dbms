<?php

include 'includes/styles.html';

require_once 'core/init.php';

$user= new user();
if(!($user->isLoggedIn() && $user->data()->group== 1))
{
	Redirect::to('login.php');
}
?>

<style>
.container {
    padding: 20px;
}

.container form {
    border: 2px solid gray;
    padding: 50px;
}
</style>

<div class="jumbotron text-center">
    <h1>Sales Employee</h1>
</div>

<div class="container">
	<p><a href="logout.php">Logout</a></p><br><br>
	<form action="test.php" method="get">

        <div class="row">
			<div class="col-md-6">
				<label>Enter the customer information</label>
				<br><br>

				<div class="form-group">
					<label for="name">Name</label>
					<input type="text" name="name" class="form-control" minlength="4" maxlength="20">
				</div>
				<div class="form-group">
					<label for="contact">Contact</label>
					<input type="number" name="contact" class="form-control" minlength="10" maxlength="13">
				</div>
				<div class="form-group">
					<label for="addr">Address</label>
					<input type="text" name="addr" class="form-control" minlength="5" maxlength="100">
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" name="email" class="form-control" minlength="4" maxlength="20">
				</div>
			</div>

			<div class="col-md-6">
				<label>Enter the information about the product bought</label>
				<br><br>		
				
				<div class="form-group">
					<label for="pid">Product ID</label>
					<input type="number" name="pid" class="form-control" minlength="1" maxlength="10">
				</div>
				<div class="form-group">
					<label for="quantity">Quantity</label>
					<input type="number" name="quantity" class="form-control" minlength="1" maxlength="10">
				</div>
				<div class="form-group">
					<label for="cost">Cost of each unit</label>
					<input type="number" name="cost" class="form-control" minlength="1" maxlength="10">
				</div>
			</div>
		</div>

		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>