<?php
	require_once('../index.php');
	$input = wire('input'); //input from form
	$sanitizer = wire('sanitizer'); //sanitize input?
	$roles = wire('roles'); //get roles in pw
	
	//submit button name is register_submit
	if($input->post->register_submit)
	{
		//set vars from user input registration form
		$firstname = $input->post->firstname;
		$lastname = $input->post->lastname;
		$pass = $input->post->regpass;
		$email = $sanitizer->email($input->post->regemail);
		
		//check for duplicate email, display error if duplicate
		
		//didnt find duplicate email, create user
		
		$userObject = new User();
		$userObject->firstname = $firstname;
		$userObject->lastname = $lastname;
		$userObject->pass = $pass;
		$userObject->email = $email;
		$userObject->name = $email;
		//add user to basic role, later they will choose add to student/coach
		$userObject->roles->add($roles->get("guest"));
		
		$userObject->save();
		
		
		//if valid login, send email, and return success
		if(wire('session')->login($email, $pass))
		{
			//add post variable for newlyregistered
			//$_POST->newlyregistered = 1;
			//send email
			//mail($email, "Test email yo", "<div>test email body yo</div>", "From: tehandyb@hotmail.com\nContent-Type: text/html");
			echo "successful_registration"; 
		}
		else {
			//something went wrong
			echo "<div class='errormsg_registration'>
					<p>Sorry it looks like that email already belongs to another user. Please try again.</p>
					</div>";
		}
		//redirect to dashboard profile settings
		//the js will check for this and redirect
			
		
		
		
		
		
		
	}

?>