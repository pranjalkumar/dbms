<?php

include 'includes/styles.html';

require_once 'core/init.php';

$user= new user();
if(!($user->isLoggedIn() && $user->data()->group== 2))
{
	Redirect::to('login.php');
}

?>

<style>
.container {
    padding: 20px;
    width: 40%;
}

.container {
    border: 2px solid gray;
    padding: 30px;
}
</style>

<div class="jumbotron text-center">
	<h1>Admin</h1>
</div>

<div class="container">
	<p><a href="logout.php">Logout</a></p><br>

    <p><strong>Add:</strong></p>

	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#sales_employee">Sales Employee</a></li>
		<li><a data-toggle="tab" href="#inventory">Inventory Manager</a></li>
		<li><a data-toggle="tab" href="#supplier">Supplier</a></li>
	</ul>

	<div class="tab-content">
		<div id="sales_employee" class="tab-pane fade in active">
			<form id='form1' method="post" action="form1.php">
				<br>
				<div class="form-group">
					<label for="name">Name</label>
					<input type="text" class="form-control" name="name" minlength="4" maxlength="20">
				</div>
				
				<div class="form-group">
					<label for="name">Username</label>
					<input type="text" class="form-control" name="username" minlength="4" maxlength="10">
				</div>

				<div class="form-group">
					<label for="pass">Password</label>
					<input type="password" class="form-control" name="pass" minlength="4" maxlength="20">
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
		<div id="inventory" class="tab-pane fade">
			<form id='form2' method="post" action="form2.php">
				<br>
				<div class="form-group">
					<label for="name">Name</label>
					<input type="text" class="form-control" name="name" minlength="4" maxlength="20">
				</div>
				
				<div class="form-group">
					<label for="name">Username</label>
					<input type="text" class="form-control" name="username" minlength="4" maxlength="10">
				</div>

				<div class="form-group">
					<label for="pass">Password</label>
					<input type="password" class="form-control" name="pass" minlength="4" maxlength="20">
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
		<div id="supplier" class="tab-pane fade">
			<form id='form3' method="post" action="form3.php">
				<br>
				<div class="form-group">
					<label for="name">Name</label>
					<input type="text" class="form-control" name="name" minlength="4" maxlength="20">
				</div>
				
				<div class="form-group">
					<label for="addr">Address</label>
					<input type="text" class="form-control" name="addr" minlength="5" maxlength="100">
				</div>

				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" class="form-control" name="email" minlength="3" maxlength="20">
				</div>

				<div class="form-group">
					<label for="contact">Contact</label>
					<input type="number" class="form-control" name="contact" minlength="10" maxlength="13">
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>

</div>

<script>
$(function(){
	$("#form1").submit(function(event){
		var uname = $("#form1 input[name='username']").val();
		var name = $("#form1 input[name='name']").val();
		var pass = $("#form1 input[name='pass']").val();

		event.preventDefault();

		$.ajax({
			url:'form1.php',
			data: 'name='+ name + '&username='+ uname + '&pass='+ pass,
			method: 'post',
			success: function(result){
				alert("Sales Employee Added Successfully");
			}
		});
	});

	$("#form2").submit(function(event){
		var uname = $("#form2 input[name='username']").val();
		var name = $("#form2 input[name='name']").val();
		var pass = $("#form2 input[name='pass']").val();

		event.preventDefault();

		$.ajax({
			url:'form2.php',
			data: 'name='+ name + '&username='+ uname + '&pass='+ pass,
			method: 'post',
			success: function(result){
				alert("Inventory Manager Added Successfully");
			}
		});
	});
	
	$("#form3").submit(function(event){
		var name = $("#form3 input[name='name']").val();
		var addr = $("#form3 input[name='addr']").val();
		var email = $("#form3 input[name='email']").val();
		var contact = $("#form3 input[name='contact']").val();

		event.preventDefault();

		$.ajax({
			url:'form3.php',
			data: 'name=' + name + '&addr=' + addr + '&email=' + email + '&contact=' + contact,
			method: 'post',
			success: function(result){
				alert("Supplier Added Successfully");
			}
		});
	});
});
</script>