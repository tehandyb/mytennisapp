<?php



//if logout, redirect 
if($input->get->logout == 1)
{
	$session->logout();
	$session->redirect($config->urls->root);

}

//show login/register form for users who arent logged in
if(!$user->isLoggedin())
{
	//if the user and pass variables were submitted/exist in post
	if($input->post->user && $input->post->pass) 
	{
		
			//check for login before output/redirect to 
			//user dash
			$user = $sanitizer->username($input->post->user);
			$pass = $input->post->pass;
			
			if ($session->login($user, $pass)) {
					//successful login, redirect to user dash, or create page for newly registered users
					if($_REQUEST['dest'])
					{
						$redirpath=$path->path .$_REQUEST['dest'];
						$session->redirect($redirpath);
					}
					else {
						$session->redirect($page->path);
					}
					
					
					
			}
			else {
				//create session var login_error to display 
				
					$session->login_error = 'Login Failed. Forgot your password? Use the forgotten password link below.';
				//echo "asdfs<script> $('#loginmodal').modal('show');</script>";
			}
	}
	else {
		
		
		
		//echo "bhhbh<script> //$('#loginmodal').modal('show');</script>";
	}
	
	
?>
	
	<!DOCTYPE HTML>
	<html lang="en">
	<head>
		<title>Login</title>
		<link rel="icon" 
		      type="image/png" 
		      href="/site/templates/styles/images/tennissearchicon.png">
		
		<script src="/site/templates/scripts/jquery-2.1.1.min.js" type="text/javascript"></script>
		<script src="/site/templates/scripts/jquery.validate.min.js" type="text/javascript"></script>
		<script src="/site/templates/styles/bootstrap-3.2.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="/site/templates/scripts/registrationValidator.js" type="text/javascript"></script>
		
		<link rel="stylesheet" href="/site/templates/styles/bootstrap-3.2.0-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/site/templates/styles/loginstyle.css" />
	</head>
		<body>
		<div id="topspace">
			<div id="logoplaceholder">
			logo here
			</div>
			<div id="signin">Already a member? <a href="#" class="btn btn-md btn-success"
						data-toggle="modal"
						data-target="#loginmodal">Login</a>
			</div>
		</div>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<div id="bodyplaceholder">body placeholder
		<script>
		
		
		function success(position) {
			var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({'latLng':latlng}, function (results, status) 
			{
				if(status !== google.maps.GeocoderStatus.OK)
				{
					$('#bodyplaceholder').append("<p>geocoder status bad</p>");
				}
				if(status == google.maps.GeocoderStatus.OK)
				{
					var address = (results[0].formatted_address);
					$('#bodyplaceholder').append("<p>location formatted: " + address + "</p>");
				}
			
			});
			$('#bodyplaceholder').append("<p>latlng yo: " + latlng + "</p>");
		}
		function error(msg) {
			$('#bodyplaceholder').append("<p>location bad</p>" + msg);
		}
		if(navigator.geolocation)
		{
			navigator.geolocation.getCurrentPosition(success, error);
		}
		else {
			error('not supported!!');
		}
		
		</script>
		</div>
		
		<div id="footerspace"><a href="#" class="btn btn-md btn-success"
					data-toggle="modal"
					data-target="#registermodal">Register</a>
		</div>
		
			<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">header</div>
							<div class="modal-body" id="loginformfields">
								<form method="post" action="./<?php if($input->get->dest){echo '?dest='.$input->get->dest;} ?>" class="loginform">
									<div class="loginform">
										<?php
										//if login was submitted but failed show login with error
											if ($input->post->user && $input->post->pass)
											{
												
													echo "<p class='error_login'>" . $session->login_error . "</p>";
													
													echo "<script> $('#loginmodal').modal('show');</script>";
											}
											elseif($page->url !== $config->urls->root){
												$loginpathredir=$config->urls->root . "?dest=" . $page->path;
													$session->redirect($loginpathredir);
												
											}
											elseif ($input->get->dest) {
												echo "<script> $('#loginmodal').modal('show');</script>";
											}
										
										 ?>
										 <input type="text" name="user" value="" placeholder="Email"/>
										 <input type="password" name="pass" value="" placeholder="Password"/>
										 <p><input type="submit" class="btn" name="submit" value="Login" /></p>
									
									</div>
								</form>
							</div>
					</div>
				</div>
			</div>
		
			<!--registration-->
			
			<div class="modal fade" id="registermodal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="regmodalheader">Register for a MyTennis Account</div>
						</div>
						
							<div class="modal-body" id="regformfields">
						
								<!--<fieldset>
								<legend></legend>-->
								<form action="./" method="post" class="registerform">
									<div class="clearfix"><div class="input"><input type="text" id="firstname" name="firstname" value="" maxlength="50" placeholder="First Name"/></div></div>
									<div class="clearfix"><div class="input"><input type="text" id="lastname" name="lastname" value="" maxlength="50" placeholder="Last Name" /></div></div>
									<div class="clearfix"><div class="input"><input type="password" id="regpass" name="regpass" value="" placeholder="Password"/></div></div>
									<div class="clearfix"><div class="input"><input type="password" name="confirm_pass" value="" placeholder="Confirm Password"/></div></div>
									<div class="clearfix"><div class="input"><input type="text" name="regemail" id="regemail" value="" maxlength="40" placeholder="Email"/></div></div>
									<div class="clearfix"><div class="input"><input type="text" name="confirm_email" id="confirm_email" value="" maxlength="40" placeholder="Confirm Email"/></div></div>
									<div class="actions">
										<input type="submit" value="Register" class="btn primary" name="register_submit" id="register_submit" />
									</div>
									
								</form>
								<!--
								</fieldset>-->
							</div>
						</div>
				</div>
			</div>
			
			
		
		
		</body>
	</html>
<?php 
	//if not logged in 
	die();
	} //end of if !logged in 
 ?>	