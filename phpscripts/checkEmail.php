<?php
require_once('../index.php');
	//echo 'hi';

	$email = trim(strtolower($_REQUEST['regemail']));
	//echo $email;
	
	$checkemailduplicate = wire('users')->find("email=$email");
	//echo '<br/>aaa' . $checkemailduplicate;
	
	if($checkemailduplicate<>"")
	{
		echo 'false';
	}
	else
	{
		echo 'true';
	}
	
	//print "false";

?>