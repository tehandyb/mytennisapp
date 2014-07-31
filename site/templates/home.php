<?php 

/**
 * Home template
 *
 */
 require("./login.php");
 include("./realhead.inc"); 
 //echo $page->body;
?>



<div class="container">
	<div class="row">
		<div class="col-md-3">
		<!--
			<div class="panel panel-info">
			    <div class="panel-heading">Heading</div>
			    <div class="panel-body">Panel Info</div>
			</div>
		-->
			<div class="row"> <!--User info row -->
				<div class="col-md-2" style="margin-top: 20px;">
					<a href=""><img src="<?php echo $user->profileimage->first()->url ?>" alt="" class="profileImgSmall"/></a>
				</div>
				<br/>
				<div class="col-md-6">
					<a href=""><?php echo ucfirst($user->firstname) . " " . ucfirst($user->lastname); ?></a><br/>
					<a href="">Edit Profile</a>
				</div>
			</div>
			<br/>
			<div class="panel panel-info">
			    <div class="panel-heading">Friends</div>
			    <div class="panel-body">Panel Info</div>
			</div>  
		</div>
		<br/>
		<div class="col-md-6">
			<div class="panel panel-info">
			    <div class="panel-heading">Heading</div>
			    <div class="panel-body">Panel Info<?php echo $user->id ?></div>
			</div>  
		</div>
	 </div>
</div>


<?php include("./realfoot.inc"); ?>

