<?php

include 'includes/styles.html';

require_once 'core/init.php';

if(Input::exists()) {
    if(Token::check(Input::get('token'))) {

        $validate = new Validate();
        $validation = $validate->check($_POST, array(
            'username' => array('required' => true),
            'password' => array('required' => true)
        ));

        if($validate->passed()) {
            $user = new User();

            $remember = (Input::get('remember') === 'on') ? true : false;
            $login = $user->login(Input::get('username'), Input::get('password'), $remember);

            if($login) {
                    if($user->data()->group== 1)
                            {Redirect::to('sales_employee.php');
                            }
                    else if($user->data()->group== 2)
                        {
                            Redirect::to('admin.php');
                        }
                    else if($user->data()->group==3)
                        {   
                            Redirect::to('inventory_manager.php');
                        }
            } else {
                echo '<p>Incorrect username or password</p>';
            }
        } else {
            foreach($validate->errors() as $error) {
                echo $error, '<br>';
            }
        }
    }
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
    <h1>Login</h1>
</div>

<div class="container">
    <form action="" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" name="username" value="<?=Input::get('username')?>" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password" required>
        </div>

        <div class="checkbox">
            <label><input type="checkbox" name="remember" id="remember"> Remember me</label>
        </div>

        <input type="hidden" name="token" value="<?=Token::generate()?>">
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
</div>