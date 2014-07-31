<?php 

require("./login.php");
include("./realhead.inc");


?>
	<div class="row" id="settingsRow">
		<div class="col-md-2" id="chooseSettings">
			<div class="panel ">
				
				<div class="panel-body">
					<table class="table table-condensed">
						<thead><tr><th>Edit</th></tr></thead>
						<tr><td><a href="#">Edit Profile</a></td></tr>
						<tr><td><a href="#">Settings</a></td></tr>
					</table>
				</div>
				
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">My Info</div>
				<div class="panel-body">
					<form method="" action="" class="form-horizontal">
						<div class="row">
							<div class="form-group">
							       <label for="customProfileUrl" class="control-label col-xs-4">Custom Profile Url</label>
							       <div class="col-xs-6">
							           <input type="text" class="form-control" id="customProfileUrl" placeholder="Email" value="<?php echo $user->firstname . "." . $user->lastname; ?>">
							       </div>
							</div>
						</div>
						
						
						<div class="row">
							<div class="form-group">
								<label for="firstName" class="control-label col-xs-4">First Name</label>
								<div class="col-xs-6">
									<input type="text" name="firstName" value="<?php if($user->firstname){echo $user->firstname;} ?> " class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label for="lastName" class="control-label col-xs-4">Last Name</label>
								<div class="col-xs-6">
									<input type="text" name="lastName" value="<?php if($user->lastname){echo $user->lastname;} ?>" class="form-control" />
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group">
								<label for="zipcode" class="control-label col-xs-4">Zip Code</label>
								<div class="col-xs-6">
									<input type="text" name="zipcode" value="<?php if($user->zipcode){echo $user->zipcode; }?> " class="form-control" />
									<span class="help-block">Lets us recommend coaches for you</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label for="lastName" class="control-label col-xs-4">Something else</label>
								<div class="col-xs-6">
									<input type="text" name="lastName" value="<?php if($user->lastname){echo $user->lastname; }?>" class="form-control" />
								</div>
							</div>
						</div>
					</form>
				</div>
				
			</div><!--end big panel-->
		</div><!--end big panel column-->
	</div><!-- end row-->
</body>

<?php include("./realfoot.inc"); ?>

 