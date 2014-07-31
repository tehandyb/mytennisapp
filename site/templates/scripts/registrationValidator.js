$(document).ready(function () {

	$(".loginform").validate(
	{
		errorPlacement: function (error, element) {
			error.addClass("regerrorlabel");
			error.insertAfter(element);
		
		},
		rules:{
			user: "required",
			pass: "required"
		},
		messages: {
			user: "Please enter your Username",
			pass: "Please enter your Password"
		}
		/*,
		submitHandler: function(form) {
			
			$.post('/phpscripts/checklogin.php', $(".loginform").serialize(), function(data) {
				if (data=='successful_login'){
					var url = "/";    
					$(location).attr('href',url);
				}else{
				$(".loginformfields").prepend($(data)); 
				/*
					$(".regformfields").prepend($(data).hide().fadeIn('slow'));  
				    $(".errormsg_registration").fadeOut(5000);  
					$("#register_submit").attr('value','Register');    
					$("#register_submit").removeAttr('disabled');
					
				}
			});
		}*/
		
	
	});

	$(".registerform").validate(
	{	
		debug: true,
		onfocusout: true,
		errorPlacement: function (error, element) {
			error.addClass("regerrorlabel");
			error.insertAfter(element);
		
		},
			rules:{
				firstname: {
					required: true
				},
				lastname: {
					required: true
				},
				regpass: {
					required: true,
					minlength: 6
				},
				confirm_pass: {
					required: true,
					equalTo: "#regpass"
				},
				regemail: {
					required: true,
					email: true,
					remote: "/phpscripts/checkEmail.php"
				},
				confirm_email: {
					required: true,
					equalTo: "#regemail"
				}
		},
			messages:{
				firstname: {
					required: "First name required"
				},
				lastname: {
					required: "Last name required"
				},
				regpass: {
					required: "Password required",
					minlength: jQuery.validator.format("Password must be at least {0} characters ")
				},
				confirm_pass: {
					required: "Repeat password",
					equalTo: "Passwords dont match"
				},
				regemail: {
					required: "Email required",
					email: "Email not valid",
					remote: "Email already exists for another user"
				},
				confirm_email: {
					required: "Repeat email",
					equalTo: "Emails dont match"
				}
			},
			
			submitHandler: function(form) {
				$("#register_submit").attr('value','Processing...');
				$("#register_submit").attr('disabled', 'disabled');
				$.post('/phpscripts/register.php', $(".registerform").serialize(), function(data) {
					if (data=='successful_registration'){
						//redirect to the create profile page to customize the user page
						var url = "/createprofile";    
						$(location).attr('href',url);
					}else{
						$(".regformfields").prepend($(data).hide().fadeIn('slow'));  
					    $(".errormsg_registration").fadeOut(5000);  
						$("#register_submit").attr('value','Register');    
						$("#register_submit").removeAttr('disabled');
					}
				});
			}
	
	});
});