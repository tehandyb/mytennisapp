<?php
require_once('../index.php');
$input = wire('input');
if($input->post->user && $input->post->pass) 
{
	
		//check for login before output/redirect to 
		//user dash
		$user = $sanitizer->username($input->post->user);
		$pass = $input->post->pass;
		
		if ($session->login($user, $pass)) {
				//successful login, redirect
				echo 'successful_login';
		}
		else {
			//create session var login_error to display 
			echo '<div>Unsuccessful login yo</div>';
				$session->login_error = 'Login Failed. Forgot your password? Use the forgotten password link below.';
			
		}
}
?>