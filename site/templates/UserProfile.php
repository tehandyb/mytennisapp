<?php 

/**
 * Home template
 *
 */
 require("./login.php");
 include("./realhead.inc"); 
 //echo $page->body;
 
?>
<div> here's a users page, the user this page belongs to is named: <a href=""><?php echo $page->profileOwnedBy_fk->firstname . " " . $page->profileOwnedBy_fk->lastname; ?></a> </div>





<?php include("./realfoot.inc"); ?>
