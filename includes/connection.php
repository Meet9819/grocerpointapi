<?php
    error_reporting(0);
 		 ob_start();
    session_start();
 
 	header("Content-Type: text/html;charset=UTF-8");
	
	 
				 DEFINE ('DB_USER', 'root');
				 DEFINE ('DB_PASSWORD', '');
				 DEFINE ('DB_HOST', 'localhost'); //host name depends on server
				 DEFINE ('DB_NAME', 'grocerpointapp');
		 
	
	$mysqli =mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);

	if ($mysqli->connect_errno) 
	{
    	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}

	mysqli_query($mysqli,"SET NAMES 'utf8'");	 
 
  
?> 
	 
 