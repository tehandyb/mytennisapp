<?php
	/*	Include this header in all the main pages
	*
	*
	*/
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />

	<title><?php echo $page->get("headline|title"); ?></title>
	<link rel="icon" 
	      type="image/png" 
	      href="/site/templates/styles/images/tennissearchicon.png">
	
	<script src="/site/templates/scripts/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="/site/templates/scripts/defaultImage.js" type="text/javascript"></script>
	<script src="/site/templates/styles/bootstrap-3.2.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
	
	<link rel="stylesheet" href="/site/templates/styles/bootstrap-3.2.0-dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<?php echo $config->urls->templates?>styles/realmain.css" />
</head>

<body>

<nav class="topbar navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-inner">
		<div class="container">
			<div class="navbar-header">
			<a href="#" class="navbar-brand">MyT</a>
			</div>
			
			
			<div class="row" >
				<div class="col-md-6 col-md-offset-1" style="background-color: ;">
					<form class="navbar-form top_search_form">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search by Name or Location" />
						</div>
						<button type="submit"><img src="/site/templates/styles/images/tennissearchicon.png" alt="Go" /></button>
						
					</form>
				</div>
				<div class="col-md-3" style="background-color: ;">
					<ul class="nav navbar-nav">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle btn-navbar" data-toggle="dropdown">
							<img src="<?php echo $user->profileimage->first()->url; ?>" alt="" class="profileImgTiny"/><?php echo ucfirst($user->firstname); ?><span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="?logout=1" >Logout</a></li>
								<li><a href="
								<?php 
									if ($user->user_profilepage_fk->url) {
										echo $user->user_profilepage_fk->url;
									}
									else {
										echo '/createprofile';
									}
								 ?>" >Profile</a></li>
							</ul>
							
						</li>
						
						<li><a href="<?php echo $config->urls->root; ?>" class="menulink">Home</a></li>
						
					
					</ul>
				</div>
			
			
			</div>
		</div>
	</div>
</nav>


