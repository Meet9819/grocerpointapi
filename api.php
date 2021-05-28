<?php include("includes/connection.php");
 	  include("includes/function.php"); 
 	   include("includes/GCM.php"); 

	$file_path = 'https://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/';
	
	
		
	//user verify otp
	 if(isset($_GET['postUsermobileRegister'])) 
	{
	   
      	    $phone = $_POST['mobile'];
            $text=rand(1000,9999);

	        if($_POST['mobile']!="")
	        {
	            
	            
	             $qry5 = "SELECT * FROM tbl_registration WHERE mobile = '".$phone."' and status = 1"; 	 
			$result5 = mysqli_query($mysqli,$qry5);
			$row5 = mysqli_fetch_assoc($result5);
			$num_rows5 = mysqli_num_rows($result5);
	            
           
    	        if ($num_rows5 > 0 )
    			{
    			    $set['GROCERY_APP'][]=array('msg' => "You have already register with this Number",'success'=>'0');
    	        
            	 	 header( 'Content-Type: application/json; charset=utf-8' );
        	          echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
        	    	 die();
    			    
    			}else{
    			    
                 $qry1 = "SELECT * FROM tbl_registration WHERE mobile = '".$phone."'  and status='1'"; 	 
    			$result1 = mysqli_query($mysqli,$qry1);
    			$row1 = mysqli_fetch_assoc($result1);
    			$num_rows = mysqli_num_rows($result1);
    
    			
        	        if ($num_rows > 0 )
        			{
        			    
    		           $user_edit= "UPDATE tbl_registration SET confirm_code='".$text."' WHERE mobile = '".$phone."'  and status='1'"; 	
    		           
        		           $user_res = mysqli_query($mysqli,$user_edit);	
        		           
        		           
        		           $row = mysqli_fetch_assoc($user_res);
    
        		        	
                                // Authorisation details.
                            		$username = "hindtsk@gmail.com";
    
                            	$hash = "ae65a5228cb9561b576652d21e50698bf38a80cee29bde7070b3426340bea0d8";
                            
                            	// Config variables. Consult http://api.textlocal.in/docs for more info.
                            	$test = "0";
                            
                            	// Data for text message. This is the text message data.
                                 $sender = "MRASOI"; // This is who the message appears to be from.
                
                            	$numbers = $phone; // A single number or a comma-seperated list of numbers
                                
                               
                                
                                $message = " Thank you for Registration with MyRasoi, your OTP is ".$text;
                                
                            	// 612 chars or less
                            	// A single number or a comma-seperated list of numbers
                            	$message = urlencode($message);
                            	$data = "username=".$username."&hash=".$hash."&message=".$message."&sender=".$sender."&numbers=".$numbers."&test=".$test;
                            	$ch = curl_init('http://api.textlocal.in/send/?');
                            	curl_setopt($ch, CURLOPT_POST, true);
                            	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                            	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                                $response = curl_exec($ch);
                                //	curl_close($ch);
                                //   $response = curl_exec($ch);
                            
                               $result = json_decode($response, true);
                	
                			   if($result['status'] == "success"){
                				    $set['GROCERY_APP'][]=array('msg' => "OTP request sent",'success'=>'1');
                			   }
                			   else{
                			    	$set['GROCERY_APP'][]=array('msg' => "Please enter a valid phone number",'success'=>'0');
                			   }
                			   	curl_close($ch);
          
                        	 	 header( 'Content-Type: application/json; charset=utf-8' );
                    	          echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
                    	    	 die();
                    
        
        			}else
        			{
        			    
        			    
    				 $insert_user1="INSERT INTO tbl_registration 
				  (f_name,
				  l_name,
				  password,
				    dob,
				  gender,
				   country,
				   mobile,
				   email,
				   image,
				   wallet,
				confirm_code,
					token,
				   status
				 
				) VALUES (
					'".$_POST['f_name']."',
					'".$_POST['l_name']."',
					'".$_POST['password']."',
					'".$_POST['dob']."',
					'".$_POST['gender']."',
					'".$_POST['country']."',
					'".$_POST['mobile']."',
					'".$_POST['email']."',
					'',
						0,
					'$text',
						'".$_POST['token']."',
					0
				)"; 
        			    
         
        	           
        	            $result1=mysqli_query($mysqli,$insert_user1); 
        	            $last_id = mysqli_insert_id($mysqli);
        	            
                                                 // Authorisation details.
                		$username = "hindtsk@gmail.com";

                	$hash = "ae65a5228cb9561b576652d21e50698bf38a80cee29bde7070b3426340bea0d8";
                
                	// Config variables. Consult http://api.textlocal.in/docs for more info.
                	$test = "0";
                
                	// Data for text message. This is the text message data.
                     $sender = "MRASOI"; // This is who the message appears to be from.
    
                	$numbers = $phone; // A single number or a comma-seperated list of numbers
                    
                   
                    
                    $message = " Thank you for Registration with MyRasoi, your OTP is ".$text;
                    
                	// 612 chars or less
                	// A single number or a comma-seperated list of numbers
                	$message = urlencode($message);
                	$data = "username=".$username."&hash=".$hash."&message=".$message."&sender=".$sender."&numbers=".$numbers."&test=".$test;
                	$ch = curl_init('http://api.textlocal.in/send/?');
                	curl_setopt($ch, CURLOPT_POST, true);
                	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    $response = curl_exec($ch);
                    //	curl_close($ch);
                    //   $response = curl_exec($ch);
                
                   $result = json_decode($response, true);
    			   if($result['status'] == "success"){
    				    $set['GROCERY_APP'][]=array('msg' => "OTP request sent",'success'=>'1');
    			   }
    			   else{
    			    	$set['GROCERY_APP'][]=array('msg' => "Please enter a valid phone number",'success'=>'0');
    			   }
    			   	curl_close($ch);
  
            	 	 header( 'Content-Type: application/json; charset=utf-8' );
        	          echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
        	    	 die();
    
                		      
        			}
    
    	        }
	        }else
	        {
	            $set['GROCERY_APP'][]=array('msg' => "Please enter a valid phone number",'success'=>'0');
	        
        	 	 header( 'Content-Type: application/json; charset=utf-8' );
    	          echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    	    	 die();

	        }



	}
	
	
	//Login with ussername and password
else if(isset($_GET['postUsersLogin']))
{
	if($_POST['phone_number']!=="" and $_POST['password']!=="")
	{

	
		$phone_number = $_POST['phone_number'];
		$password = $_POST['password'];

	  $qry = "SELECT * FROM tbl_registration WHERE mobile = '".$phone_number."' and password = '".$password."' and status = 1 "; 
		
		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row = mysqli_fetch_assoc($result);
		
    	if ($num_rows > 0)
		{ 
			$set['GROCERY_APP'][]	= array(  
							'msg' => "Profile verify successfully"  ,
                			'success'=>'1',
                			'id'	=>	$row['id'],
                			'f_name' =>	$row['f_name'],
                			'l_name'	=>	$row['l_name'],
                			'password'	=>	$row['password'],
                			'dob'	=>	$row['dob'],
                			'gender'	=>	$row['gender'],
                			'country'	=>	$row['country'],
                			'mobile'	=>	$row['mobile'],
                			'email'	=>	$row['email'],
                			'image'	=>	$row['image'],
                			'wallet'	=>	$row['wallet'],
                			'confirm_code'	=>	$row['confirm_code'],
                			'token'	=>	$row['token'],
                            'status'	=>	$row['status'],
	     								);
		  
			header( 'Content-Type: application/json; charset=utf-8' );
    	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    		die();
		}		 
		else
		{
			$set['GROCERY_APP'][]=array('msg' =>'Invalid username and password','success'=>'0');
 	
			header( 'Content-Type: application/json; charset=utf-8' );
    	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    		die();
		}
	}	else
	{
		$set['GROCERY_APP'][]=array('msg' =>'Invalid username and password','success'=>'0');
 
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
	}

}
	
	
	    //user verify otp from setting screen
	else if(isset($_GET['mobilenumberverify'])) 
	{
	   
      		$phone = $_POST['phone'];
      		$confirm_code = $_POST['confirm_code'];

             $qry1 = "SELECT * FROM tbl_registration WHERE mobile = '".$phone."'  and confirm_code='".$confirm_code."' and status = 0 ";	 
			$result1 = mysqli_query($mysqli,$qry1);
			$row = mysqli_fetch_assoc($result1);
			 $num_rows = mysqli_num_rows($result1);

	        
	        if ($num_rows > 0 )
			{
    		
           
	           $user_edit1= "UPDATE tbl_registration SET status = 1 WHERE mobile = '".$phone."' and confirm_code='".$confirm_code."' ";	
	           
	           $user_res1 = mysqli_query($mysqli,$user_edit1);	
         
			  $qry2 = "SELECT * FROM tbl_registration WHERE mobile = '".$phone."'  and status = 1 ";	 
			$result2 = mysqli_query($mysqli,$qry2);
			$row2 = mysqli_fetch_assoc($result2);

                 $set['GROCERY_APP'][]	=	array(
                 'msg' => "Profile verify successfully"  ,
    			'success'=>'1',
    			'id'	=>	$row['id'],
    			'f_name' =>	$row['f_name'],
    			'l_name'	=>	$row['l_name'],
    			'password'	=>	$row['password'],
    			'dob'	=>	$row['dob'],
    			'gender'	=>	$row['gender'],
    			'country'	=>	$row['country'],
    			'mobile'	=>	$row['mobile'],
    			'email'	=>	$row['email'],
    			'image'	=>	$row['image'],
    			'wallet'	=>	$row['wallet'],
    			'confirm_code'	=>	$row['confirm_code'],
    			'token'	=>	$row['token'],
                'status'	=>	$row['status'],
						);
	    							
				   
            		
        	}
	        else
	        {
	            $set['GROCERY_APP'][]=array('msg' => "Please enter a valid OTP",'success'=>'0');
	        
        

	        }
	        
	        	 	 header( 'Content-Type: application/json; charset=utf-8' );
    	          echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    	    	 die();
	}


	
  		// user registration
  	
	if(isset($_GET['postUserRegister']))
 	{


		$qry = "SELECT * FROM tbl_registration WHERE mobile = '".$_POST['mobile']."'"; 
		$result = mysqli_query($mysqli,$qry);
		$row = mysqli_fetch_assoc($result);
				$num_rows 	= mysqli_num_rows($result);

 	 	if($num_rows > 0)
		{
			$set['GROCERY_APP'][]=array('msg' => "Phone Number is already used !",'success'=>'0');
		}
		else
		{ 
			if($_POST['f_name']!="" AND $_POST['l_name']!="" AND $_POST['password']!="" and  $_POST['mobile']!=""  )
			{
			    
			      $rand=rand(1000,9999);
			    
					 $qry1="INSERT INTO tbl_registration 
				  (f_name,
				  l_name,
				  password,
				  dob,
				  gender,
				   mobile,
				   email,
				   image,
				    token,
				     code,
				      reff_code,
				   status
				) VALUES (
					'".$_POST['f_name']."',
					'".$_POST['l_name']."',
					'".$_POST['password']."',
					'',
					'',
					'".$_POST['mobile']."',
					'',
					'',
					'',
					'".$rand."',
					'".$_POST['reff_code']."',
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_registration WHERE id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);


			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Register Successfully ",
			'success'=>'1',
			'id'	=>	$row['id'],
			'f_name' =>	$row['f_name'],
			'l_name'	=>	$row['l_name'],
			'password'	=>	$row['password'],
			'dob'	=>	$row['dob'],
			'gender'	=>	$row['gender'],
			'mobile'	=>	$row['mobile'],
			'email'	=>	$row['email'],
			'image'	=>	$row['image'],
            'token'	=>	$row['token'],
            'code'	=>	$row['code'],
            'reff_code'	=>	$row['reff_code'],
			'status'	=>	$row['status'],

			);
			}else
			{
				$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
			}
  			
				
			
		}

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//Login with ussername and password
else if(isset($_GET['postUserLogin']))
{
	if($_POST['mobile']!="" and $_POST['password']!="")
	{
	
		$mobile = $_POST['mobile'];
		$password = $_POST['password'];
			$token = $_POST['token'];
	
	  $qry = "SELECT * FROM tbl_registration WHERE mobile = '".$mobile."' and password = '".$password."' and status = 1 "; 
		
		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row = mysqli_fetch_assoc($result);
		
    	if ($num_rows > 0)
		{ 
		    
		    
		    $user_edit= "UPDATE tbl_registration SET token ='".$token."' WHERE mobile = '".$mobile."' and password = '".$password."'"; 
    		           
        	$user_res = mysqli_query($mysqli,$user_edit);	
		    
			$set['GROCERY_APP'][]	= array(  
			'msg' =>	" Successfully login",
			'success'=>'1',
			'id'	=>	$row['id'],
			'f_name' =>	$row['f_name'],
			'l_name'	=>	$row['l_name'],
			'password'	=>	$row['password'],
			'dob'	=>	$row['dob'],
			'gender'	=>	$row['gender'],
			'mobile'	=>	$row['mobile'],
			'email'	=>	$row['email'],
			'image'	=>	$row['image'],
            'token'	=>	$row['token'],
            'code'	=>	$row['code'],
            'reff_code'	=>	$row['reff_code'],
			'status'	=>	$row['status'],
	     								
	     								);
		  
		}		 
		else
		{
			$set['GROCERY_APP'][]=array('msg' =>'Invalid username and password','success'=>'0');
 	
		}
	}else {
		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
	}

			header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//users update profile
else if(isset($_GET['postUserProfileUpdate1']))
{
	
		$sql = "SELECT * FROM tbl_registration where id = '".$_POST['id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);

			//id	f_name	l_name	password	dob	gender	country	mobile	email	status
	if($_FILES['image']['name'] != "")
		{	
			if($row['image'] !== "") 
			{
			 	unlink('images/'.$row['image']); 
			 	unlink('images/thumbs/'.$row['image']); 
			}

			$facility_image=rand(0,99999)."_".$_FILES['image']['name'];
		   //Main Image
		   	$tpath1='images/'.$facility_image; 		
			$pic1=compress_image($_FILES["image"]["tmp_name"], $tpath1, 80);
		 	$thumbpath='images/thumbs/'.$facility_image;		
	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 		}
 		else
 		{
 			(($row['image'] !== "") ? $facility_image = $row['image'] : $facility_image = "");
 		}

		
 if($_POST['password']!="")
		{
			$user_edit= "UPDATE tbl_registration SET 
			f_name='".$_POST['f_name']."',
			l_name='".$_POST['l_name']."',
			password='".$_POST['password']."',
			mobile='".$_POST['mobile']."',
            image='".$facility_image."'
			WHERE id = '".$_POST['id']."'";	 
		
		}
		else
		{
			$user_edit= "UPDATE tbl_registration SET 
			f_name='".$_POST['f_name']."',
			l_name='".$_POST['l_name']."',
			mobile='".$_POST['mobile']."',
	        image='".$facility_image."'

			WHERE id = '".$_POST['id']."'";	 
		}
   		
   			$user_res = mysqli_query($mysqli,$user_edit);	
	  	
			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//users update profile
else if(isset($_GET['postUserProfileUpdate']))
{
	
		$sql = "SELECT * FROM tbl_registration where id = '".$_POST['id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);
    	$num_rows = mysqli_num_rows($res);
    	
    	if($num_rows > 0)
    	{
    	    if($_FILES['image']['name'] != "")
	    	{
    			if($row['image'] !== "") 
    			{
    			 	unlink('images/'.$row['image']); 
    			 	unlink('images/thumbs/'.$row['image']); 
    			}

    			$facility_image=rand(0,99999)."_".$_FILES['image']['name'];
    		   //Main Image
    		   	$tpath1='images/'.$facility_image; 		
    			$pic1=compress_image($_FILES["image"]["tmp_name"], $tpath1, 80);
    		 	$thumbpath='images/thumbs/'.$facility_image;		
    	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
     		}
     		else
     		{
     			(($row['image'] !== "") ? $facility_image = $row['image'] : $facility_image = "");
     		}
		
      
			$user_edit= "UPDATE tbl_registration SET 
			f_name='".$_POST['f_name']."',
			l_name='".$_POST['l_name']."',
			mobile='".$_POST['mobile']."',
			email='".$_POST['email']."',
				dob='".$_POST['dob']."',
					gender='".$_POST['gender']."',
			image='".$facility_image."'
			WHERE id = '".$_POST['id']."'";	 
			
			$user_res = mysqli_query($mysqli,$user_edit);	

		
		}else
    	{
	    	$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}
    
	  	
		$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//get users profile with users id
else if(isset($_GET['getUserProfile']))
{
		
		$qry = "SELECT * FROM tbl_registration WHERE id = '".$_POST['id']."'"; 
		$result = mysqli_query($mysqli,$qry);
		$row = mysqli_fetch_assoc($result);
	  				 
	   	$set['GROCERY_APP'][]	= array(  
			'msg' =>	" Successfully login",
			'success'=>'1',
			'id'	=>	$row['id'],
			'f_name' =>	$row['f_name'],
			'l_name'	=>	$row['l_name'],
			'password'	=>	$row['password'],
			'dob'	=>	$row['dob'],
			'gender'	=>	$row['gender'],
			'mobile'	=>	$row['mobile'],
			'email'	=>	$row['email'],
			'image'	=>	$row['image'],
            'token'	=>	$row['token'],
            'code'	=>	$row['code'],
            'reff_code'	=>	$row['reff_code'],
			'status'	=>	$row['status'],
	     								
	     		);

		
	   	header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}




//get all category 
else if(isset($_GET['get_category']))
{

		$jsonObj1= array();
			

		 $query="SELECT * FROM tbl_category where tbl_category.c_id and tbl_category.c_status='1' ORDER BY tbl_category.c_id";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

			$row['c_id'] = $data['c_id'];
			$row['c_name'] = $data['c_name'];
			$row['c_image'] = $file_path.'images/'.$data['c_image'];
			$row['c_image_thumb'] = $file_path.'images/thumbs/'.$data['c_image'];
			$row['c_status'] = $data['c_status'];
		
 
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}
// //get all subcategory with category wise
//  else if(isset($_GET['get_sub_category']))
//  	{


// 		$jsonObj1= array();
			
        
// 		 $query="SELECT * FROM `tbl_sub_category` 
// 		 LEFT JOIN tbl_category ON tbl_category.c_id=tbl_sub_category.c_id 
// 		 order by tbl_sub_category.sub_id desc";
// 		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

// 		while($data = mysqli_fetch_assoc($sql))
// 		{

// 			$row['sub_id'] = $data['sub_id'];
// // 			$row['c_id']=$data['c_id'];
// // 			$row['c_name']=$data['c_name'];
// 			$row['sub_name'] = $data['sub_name'];
// 			$row['sub_category_image'] = $file_path.'images/'.$data['sub_image'];
// 			$row['sub_category_image_thumb'] = $file_path.'images/thumbs/'.$data['sub_image'];
//  			$row['sub_status'] = $data['sub_status'];
// 			array_push($jsonObj1,$row);

		
// 		}
		
// 		$set['GROCERY_APP'] = $jsonObj1;	

		
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();
//  }

//  //get all product subcategory with category wise search
//  else if(isset($_GET['get_product_search']))
//  	{


//   		  		$jsonObj4= array();
			
//  		  $tableName="tbl_product";   


// 	      $limit = 10; 
	      
// 	      $query = "SELECT COUNT(*) as num FROM $tableName
// 	      WHERE tbl_product.p_name like '%".addslashes($_GET['p_name'])."%' ORDER BY tbl_product.p_id ASC";
	      
// 	      $total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
// 	      $total_pages = $total_pages['num'];
	      
// 	      $stages = 3;
// 	      $page=0;
// 	      if(isset($_GET['page'])){
// 	      $page = mysqli_real_escape_string($mysqli,$_GET['page']);
// 	      }
// 	      if($page){
// 	        $start = ($page - 1) * $limit; 
// 	      }else{
// 	        $start = 0; 
// 	        } 
	
// 		 $query="SELECT * FROM `tbl_product`
// LEFT JOIN tbl_sub_category ON tbl_sub_category.sub_id=tbl_product.sub_id
// WHERE tbl_product.p_name like '%".addslashes($_GET['p_name'])."%' LIMIT $start, $limit";			
        
// // 		 $query="SELECT * FROM `tbl_product`
// // LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id
// // LEFT JOIN tbl_sub_category ON tbl_sub_category.sub_id=tbl_product.sub_id
// // WHERE tbl_product.p_name like '%".addslashes($_GET['p_name'])."%' LIMIT $start, $limit";

// 		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

// 		while($data = mysqli_fetch_assoc($sql))
// 		{
// 			$row['p_id']=$data['p_id'];
// // 			$row['c_id']=$data['c_id'];
// // 			$row['c_name']=$data['c_name'];
// 			$row['sub_id'] = $data['sub_id'];
// 			$row['sub_name'] = $data['sub_name'];
// 			$row['p_name'] = $data['p_name'];
//  			$row['p_dis_price'] = $data['p_dis_price'];
//  			$row['p_ori_price'] = $data['p_ori_price'];
//  			$row['p_discount'] = $data['p_discount'];
//  			$row['p_desc'] = $data['p_desc'];
//  			$row['p_qty'] = $data['p_qty'];
//  			$row['p_unit'] = $data['p_unit'];
//  			$row['p_image'] = $file_path.'images/'.$data['p_image'];
//  					$row['p_top'] = $data['p_top'];
//  			$row['p_status'] = $data['p_status'];
// 			array_push($jsonObj4,$row);

		
// 		}
		
	
// 		$set['page'] = $_GET['page'];
// 		$set['totalimage'] = $total_pages;
// 		$set['limit'] = $limit;
// 		$set['success'] = '1';
// 		$set['GROCERY_APP'] = $jsonObj4;



		
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();
//  }

 //get all product subcategory with category wise
 else if(isset($_GET['get_product']))
 	{


  		  		$jsonObj4= array();
			
 		  $tableName="tbl_product";   
	      $limit = 10; 
	      
	      $query = "SELECT COUNT(*) as num FROM $tableName
	       LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id
	      WHERE tbl_product.c_id='".$_GET['c_id']."' and tbl_product.p_status = 1 ORDER BY tbl_product.p_id ASC";
	      
	      $total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
	      $total_pages = $total_pages['num'];
	      
	      $stages = 3;
	      $page=0;
	      if(isset($_GET['page'])){
	      $page = mysqli_real_escape_string($mysqli,$_GET['page']);
	      }
	      if($page){
	        $start = ($page - 1) * $limit; 
	      }else{
	        $start = 0; 
	        } 
	
			
         $query="SELECT * FROM `tbl_product`
 LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id
WHERE tbl_product.c_id='".$_GET['c_id']."' and tbl_product.p_status = 1 LIMIT $start, $limit";



		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

	$someArray = json_decode($data['p_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {

            
            	//[{"no":"1","qty":"1","unit":"kg","dis_price":"100","ori_price":"200"},
            $employees[$x]= array(
                                 'no'=> $someArray[$x]["no"],
                                   'qty'=> $someArray[$x]["qty"],
                                'unit'=> $someArray[$x]["unit"],
                                'dis_price'=> $someArray[$x]["dis_price"],
                                    'ori_price'=> $someArray[$x]["ori_price"]
                                );
        }

			$row['p_id']=$data['p_id'];
			$row['c_id']=$data['c_id'];
			$row['c_name']=$data['c_name'];
			$row['p_hsncode'] = $data['p_hsncode'];
 			$row['p_gstper'] = $data['p_gstper'];
			$row['p_name'] = $data['p_name'];
 			$row['p_desc'] = $data['p_desc'];
 			$row['Productdetails'] = $someArray;
 			$row['p_image'] = $file_path.'images/'.$data['p_image'];


 				$row['p_stock'] = $data['p_stock'];
 			$row['p_status'] = $data['p_status'];
			array_push($jsonObj4,$row);


		
		}
		
	
		$set['page'] = $_GET['page'];
		$set['totalimage'] = $total_pages;
		$set['limit'] = $limit;
		$set['success'] = '1';
		$set['GROCERY_APP'] = $jsonObj4;



		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }
 

//get all Banner 
else if(isset($_GET['get_banner']))
{

		$jsonObj1= array();
			

		 $query="SELECT * FROM tbl_banner ORDER BY tbl_banner.b_id DESC";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

			$row['b_id'] = $data['b_id'];
			$row['b_name'] = $data['b_name'];
			$row['b_image'] = $file_path.'images/'.$data['b_image'];
			$row['b_image_thumb'] = $file_path.'images/thumbs/'.$data['b_image'];
			$row['b_status'] = $data['b_status'];
		
 
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//add Adderss Details
else if(isset($_GET['add_adderss']))
{
	
  if($_POST['user_id']!="" AND $_POST['a_type']!="" AND $_POST['a_name']!="" AND $_POST['a_number']!="" AND $_POST['a_houser_no']!="" AND $_POST['a_lendmark']!="" AND $_POST['a_adderss']!="")
  {

		
  			 $qry1="INSERT INTO tbl_adderss
				  (user_id,
				  a_type,
				  a_name,
				  a_number,
				  a_houser_no,
				   a_lendmark,
				   a_adderss,
				   a_status

				) VALUES (
					'".$_POST['user_id']."',
					'".$_POST['a_type']."',
					'".$_POST['a_name']."',
					'".$_POST['a_number']."',
					'".$_POST['a_houser_no']."',
					'".$_POST['a_lendmark']."',
					'".$_POST['a_adderss']."',
					1
				)"; 
  
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_adderss WHERE a_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);



			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'a_id'	=>	$row['a_id'],
			'user_id' =>	$row['user_id'],
			'a_type'	=>	$row['a_type'],
			'a_name'	=>	$row['a_name'],
			'a_number'	=>	$row['a_number'],
			'a_houser_no'	=>	$row['a_houser_no'],
			'a_lendmark'	=>	$row['a_lendmark'],
			'a_adderss'	=>	$row['a_adderss'],
			'a_status'	=>	$row['a_status']

			);
				
		}
		else{
			$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}	
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
}


//get all adderss
else if(isset($_GET['get_adderss']))
{

		$jsonObj1= array();
			//tbl_adderss a_id	user_id	a_type	a_name	a_number	a_houser_no	a_lendmark	a_adderss	a_status


		 $query="SELECT * FROM `tbl_adderss`
		LEFT JOIN tbl_registration ON tbl_registration.id=tbl_adderss.user_id
		WHERE tbl_adderss.user_id='".$_POST['user_id']."' ORDER BY tbl_adderss.a_id DESC";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

			$row['a_id'] = $data['a_id'];
			$row['user_id'] = $data['user_id'];
			$row['f_name'] = $data['f_name'];
			$row['a_type'] = $data['a_type'];
			$row['a_name'] = $data['a_name'];
			$row['a_number'] = $data['a_number'];
			$row['a_houser_no'] = $data['a_houser_no'];
			$row['a_lendmark'] = $data['a_lendmark'];
			$row['a_adderss'] = $data['a_adderss'];
			$row['a_status'] = $data['a_status'];

		
 
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//edit address
else if(isset($_GET['Updateaddress']))
{


//tbl_adderss a_id	user_id	a_type	a_name	a_number	a_houser_no	a_lendmark	a_adderss	a_status
		
  if($_POST['user_id']!="" and $_POST['a_type']!="" and $_POST['a_name']!="" and $_POST['a_number']!="" and $_POST['a_houser_no']!="" and $_POST['a_lendmark']!="" and $_POST['a_adderss']!=""  )
		{
		    

			$user_edit="UPDATE `tbl_adderss` SET 
		    `user_id`='".$_POST['user_id']."',
		    `a_type`='".$_POST['a_type']."',
		    `a_name`='".$_POST['a_name']."',
		    `a_number`='".$_POST['a_number']."',
		    `a_houser_no`='".$_POST['a_houser_no']."',
		    `a_lendmark`='".$_POST['a_lendmark']."',
		    `a_adderss`='".$_POST['a_adderss']."'
		   
		    WHERE `a_id`='".$_POST['a_id']."'";	 
				$user_res = mysqli_query($mysqli,$user_edit);	
	  
			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
			
		
		}else {
		    	$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}
	
   		
   		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}
//delete address
else if(isset($_GET['Deleteaddress']))
 	{

		$jsonObj= array();
 		$a_id=$_POST['a_id'];

		if($_POST['a_id'] != "") 
		{

		$qry = "SELECT * FROM tbl_adderss WHERE a_id='".$a_id."'"; 
			
		$result 	= mysqli_query($mysqli,$qry);
		$num_rows 	= mysqli_num_rows($result);
			//$row = mysqli_fetch_array($result);
			
			if($num_rows > 0)
			{
			
				$delete = "DELETE FROM tbl_adderss where a_id = '".$a_id."'";
				$result1 = mysqli_query($mysqli,$delete);

				if($result1 == 1)
					$set['GROCERY_APP'][]=array('msg' => "Address deleted successfully...!",'success'=>'1');
				else
					$set['GROCERY_APP'][]=array('msg' => "Some error occured",'success'=>'0');
				

			}
			else
			{	
				$set['GROCERY_APP'][]=array('msg' => " Address Not  found ",'success'=>'0');
			} 
 	
	}
	else
		{
			$set['GROCERY_APP'][]=array('msg' => "Please enter address id",'success'=>'0');
		}	 
			header( 'Content-Type: application/json; charset=utf-8' );
 	   		echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
 			die();
		
		}
		
		
// //add order
// else if(isset($_GET['add_order1']))
// {
  

// 	if($_POST['user_id']!="" AND $_POST['c_id']!="" AND $_POST['sub_id']!="" AND $_POST['p_id']!="" AND $_POST['a_id']!="" AND $_POST['o_date']!="" 
// 	AND $_POST['o_time']!="" AND $_POST['o_amount']!="" AND $_POST['o_type']!="")
// 	{
	        
	      
//       	date_default_timezone_set("Asia/Calcutta"); //India time (GMT+5:30)
// 		$date = date('d-m-Y H:i:s');
		
//  		$qry1="INSERT INTO tbl_order
// 				  (user_id,
// 				  c_id,
// 				  sub_id,
// 				  p_id,
// 				  a_id,
// 				  o_cdate,
// 				   o_date,
// 				   o_time,
// 				   o_amount,
// 				   o_type,
// 				   o_status
// 				) VALUES (
// 					'".$_POST['user_id']."',
// 					'".$_POST['c_id']."',
// 					'".$_POST['sub_id']."',
// 					'".$_POST['p_id']."',
// 					'".$_POST['a_id']."',
// 					'".$date."',
// 					'".$_POST['o_date']."',
// 					'".$_POST['o_time']."',
// 					'".$_POST['o_amount']."',
// 					'".$_POST['o_type']."',
// 					1
// 				)"; 
            
//             $result1=mysqli_query($mysqli,$qry1);  									 
		
// 			 $last_id = mysqli_insert_id($mysqli); 
 

// 			$qrys = "SELECT * FROM tbl_order WHERE o_id = '".$last_id."'"; 
// 			$results = mysqli_query($mysqli,$qrys);
// 			$row = mysqli_fetch_assoc($results);


//   $someArray = json_decode($row['sub_id'], true);
//   print_r($someArray);
//  $values_initials = array();
     
//     for ($x = 0; $x <= count($someArray)-1 ; $x++) {
            
            
//             $query1="SELECT * FROM tbl_sub_category WHERE sub_id='".$someArray[$x]["sub_cat"]."' ";
//             $result1 = mysqli_query($mysqli,$query1);
//             	$row1 = mysqli_fetch_assoc($result1);
//             	$row2=$row1['sub_name'];
            
            
            
//              	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["sub_sub_cat"]."' ";
//             $result2 = mysqli_query($mysqli,$query2);
//             	$row3 = mysqli_fetch_assoc($result2);
//             	$row4=$row3['p_name'];
            
	        
//             $employees[] = array('sub_cat'=> $row2,'p_id'=> $row4,'p_ori_price'=> $someArray[$x]["p_ori_price"]);
            	
//     }
    
//      $jsonformat=json_encode($employees);
     

// 			$set['GROCERY_APP'][]	=	array( 
			    
// 			'msg' =>	" Successful",
// 			'success'=>'1',
// 			'o_id'	=>	$row['o_id'],
// 			'user_id' =>	$row['user_id'],
// 			'c_id'	=>	$row['c_id'],
// 			'sub_id'	=>	$jsonformat,
// 			'p_id'	=>	$jsonformat,
// 			'a_id'	=>	$row['a_id'],
// 			'o_cdate'	=>	$row['o_cdate'],
// 			'o_date'	=>	$row['o_date'],
// 			'o_time'	=>	$row['o_time'],
// 			'o_amount'	=>	$row['o_amount'],
// 			'o_type'	=>	$row['o_type'],
// 			'o_status'	=>	$row['o_status']

// 			);
				
// 	}else
// 	{
// 		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
// 	}
  			
			
	

		
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();	
// }


// else if(isset($_GET['add_order2']))
// {

// 	if($_POST['user_id']!="" AND $_POST['c_id']!="" AND $_POST['order_details']!="" AND $_POST['a_id']!="" AND $_POST['o_date']!="" AND $_POST['o_time']!="" AND $_POST['o_amount']!="" AND $_POST['o_type']!="")
// 	{
	          
//       	date_default_timezone_set("Asia/Calcutta"); //India time (GMT+5:30)
// 		$date = date('d-m-Y H:i:s');
		
//  		 $qry1="INSERT INTO tbl_order
// 				  (user_id,
// 				  c_id,
// 				  order_details,
// 				  a_id,
// 				  o_cdate,
// 				   o_date,
// 				   o_time,
// 				   o_amount,
// 				   o_type,
// 				   o_status
// 				) VALUES (
// 					'".$_POST['user_id']."',
// 					'".$_POST['c_id']."',
// 					'".$_POST['order_details']."',
// 					'".$_POST['a_id']."',
// 					'".$date."',
// 					'".$_POST['o_date']."',
// 					'".$_POST['o_time']."',
// 					'".$_POST['o_amount']."',
// 					'".$_POST['o_type']."',
// 					1
// 				)"; 
            
//             $result1=mysqli_query($mysqli,$qry1);  									 
		
// 			 $last_id = mysqli_insert_id($mysqli); 
 

// 			$qrys = "SELECT * FROM tbl_order WHERE o_id = '".$last_id."'"; 
// 			$results = mysqli_query($mysqli,$qrys);
// 			$row = mysqli_fetch_assoc($results);


//   $someArray = json_decode($row['sub_id'], true);
//   //echo $someArray;

//  $values_initials = array();
     
//     for ($x = 0; $x <= count($someArray)-1 ; $x++) {
            
            
//             $query1="SELECT * FROM tbl_sub_category WHERE sub_id='".$someArray[$x]["sub_cat"]."' ";
//             $result1 = mysqli_query($mysqli,$query1);
//             	$row1 = mysqli_fetch_assoc($result1);
//             	$row2=$row1['sub_name'];
            
            
            
//              	 $query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["sub_sub_cat"]."' ";
//             $result2 = mysqli_query($mysqli,$query2);
//             	$row3 = mysqli_fetch_assoc($result2);
//             	$row4=$row3['p_name'];
            
            
	        
//             $employees[] = array('sub_cat'=> $row2,'sub_sub_cat'=> $row4,'p_ori_price'=> $someArray[$x]["p_ori_price"]);
            	
//     }
    
//      $jsonformat=json_encode($employees);

// 			$set['GROCERY_APP'][]	=	array( 
			    
// 			'msg' =>	" Successful",
// 			'success'=>'1',
// 			'o_id'	=>	$row['o_id'],
// 			'user_id' =>	$row['user_id'],
// 			'c_id'	=>	$row['c_id'],
// 			'order_details'	=>	$jsonformat,
// 			'a_id'	=>	$row['a_id'],
// 			'o_cdate'	=>	$row['o_cdate'],
// 			'o_date'	=>	$row['o_date'],
// 			'o_time'	=>	$row['o_time'],
// 			'o_amount'	=>	$row['o_amount'],
// 			'o_type'	=>	$row['o_type'],
// 			'o_status'	=>	$row['o_status']

// 			);
				
// 	}else
// 	{
// 		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
// 	}
  			
			
	

		
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();	
// }



else if(isset($_GET['add_order']))
{

	if($_POST['user_id']!="" and $_POST['a_id']!="" and $_POST['o_amount']!="" and $_POST['o_type']!="")
	{
	          
      	date_default_timezone_set("Asia/Calcutta"); //India time (GMT+5:30)
		$date = date('d-m-Y H:i:s');
		$date1 = date('d-m-Y');
		$date2 = date('H:i:s');
	//	INSERT INTO `tbl_order`(`o_id`, `user_id`, `b_id`, `order_details`, `a_id`, `o_cdate`, `o_date`, `o_time`, `o_amount`, `cpn_id`, `cpn_price`, `o_txtfinalamount`, `payment_type`, `payment_orderid`, `o_type`, `o_status`) 
 		 $qry1="INSERT INTO tbl_order
				  (user_id,
				  order_details,
				  a_id,
				  o_cdate,
				   o_date,
				   o_time,
				   o_amount,
				        cpn_id,
				     cpn_price,
				       o_txtfinalamount,
				    payment_type,
				     payment_orderid,
				      o_type,
				   o_status
				) VALUES (
					'".$_POST['user_id']."',
					'".$_POST['order_details']."',
					'".$_POST['a_id']."',
					'".$date."',
					'".$date1."',
					'".$date2."',
					'".$_POST['o_amount']."',
						'".$_POST['cpn_id']."',
					'".$_POST['cpn_price']."',
					'".$_POST['o_txtfinalamount']."',
				    '".$_POST['payment_type']."',
				   '".$_POST['payment_orderid']."',
			    	'".$_POST['o_type']."',
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_order WHERE o_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);


  $someArray = json_decode($row['order_details'], true);
  //echo $someArray;

 $values_initials = array();
     
    for ($x = 0; $x <= count($someArray)-1 ; $x++) {
            
            
      
                 
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
            $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            
            
                  $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
	        
 
            	   $employees[] = array('category_id'=> $someArray[$x]["category"],
                                'category'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                    'p_hsncode'=> $someArray[$x]["p_hsncode"],
                                'p_gstper'=> $someArray[$x]["p_gstper"],
                                );
    }
    
   // $employees_name1=json_encode($employees_name);
     $employees1=json_encode($employees);

			$set['GROCERY_APP'][]	=	array( 
			    
			'msg' =>	" Successful",
			'success'=>'1',
			'o_id'	=>	$row['o_id'],
			'user_id' =>	$row['user_id'],
	        'order_details' => $employees1,
			'a_id'	=>	$row['a_id'],
			'o_cdate'	=>	$row['o_cdate'],
			'o_date'	=>	$row['o_date'],
			'o_time'	=>	$row['o_time'],
			'o_amount'	=>	$row['o_amount'],
			'o_type'	=>	$row['o_type'],
				 'cpn_id'	=>	$row['cpn_id'],
			 'cpn_price'	=>	$row['cpn_price'],
			 'o_txtfinalamount'	=>	$row['o_txtfinalamount'],
				'payment_type'	=>	$row['payment_type'],
			'payment_orderid'	=>	$row['payment_orderid'],
			'o_status'	=>	$row['o_status']

			);
				
	}else
	{
		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
	}
  			
			
	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
}

//get all order
else if(isset($_GET['get_order']))
{

		$jsonObj1= array();
	
		 $query="SELECT tbl_coupon.cpn_name , tbl_order.* , tbl_registration.* , tbl_adderss.*  , tbl_delivery_boy.*  FROM `tbl_order`
    left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
    left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
        left join tbl_coupon on tbl_coupon.cpn_id = tbl_order.cpn_id
   left join tbl_delivery_boy on tbl_delivery_boy.b_id = tbl_order.b_id
    WHERE tbl_order.user_id='".$_POST['user_id']."' ORDER BY tbl_order.o_id DESC";

		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{

        	$someArray = json_decode($data['order_details'], true);
        

            for ($x = 0; $x <= count($someArray) - 1 ; $x++) {

    
            
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	   $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            	
            $employees[$x] = array('category_id'=> $someArray[$x]["category"],
                                'category'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                      'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                    
                                );
    
            }
         

			$row['o_id'] = $data['o_id'];
			$row['user_id'] = $data['user_id'];
			$row['f_name'] = $data['f_name'];
			$row['order_details'] = $employees;
			$row['a_id'] = $data['a_id'];
			$row['a_name'] = $data['a_name'];
			$row['a_number'] = $data['a_number'];
			$row['a_houser_no'] = $data['a_houser_no'];
			$row['a_lendmark'] = $data['a_lendmark'];
			$row['a_adderss'] = $data['a_adderss'];
			$row['o_cdate'] = $data['o_cdate'];
			$row['o_date'] = $data['o_date'];
			$row['o_time'] = $data['o_time'];
			$row['o_amount'] = $data['o_amount'];
			$row['o_type'] = $data['o_type'];
			
			if($data['b_id'] == null && $data['b_name'] ==null && $data['b_phone']==null)
			{
			    $row['d_date_time']=0;
			    $row['d_name']='';
			    $row['d_phone']='';
			}else
			{
			    $row['d_date_time'] = $data['b_id'];
			         $row['d_name'] = $data['b_name'];
		                      $row['d_phone'] = $data['b_phone'];
			}
		                  
	if($data['cpn_id'] == 0 )
			{
			    $row['cpn_id']=0;
			    $row['cpn_name']='';
			    
			}else
			{
			  	$row['cpn_id'] = $data['cpn_id'];
			                $row['cpn_name'] = $data['cpn_name'];
		                	
		                
			}
			$row['cpn_price'] = $data['cpn_price'];
        		$row['o_txtfinalamount'] = $data['o_txtfinalamount'];		    
				$row['payment_type'] = $data['payment_type'];
			$row['payment_orderid'] = $data['payment_orderid'];
		
			$row['o_status'] = $data['o_status'];
			
                	
            
            
		  		  array_push($jsonObj1,$row);

		
		}
		
	
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}


else if(isset($_GET['cancel_order']))
{


   $qry = "SELECT * FROM `tbl_order`
left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
WHERE tbl_order.user_id='".$_POST['user_id']."' AND tbl_order.o_id='".$_POST['o_id']."' ";

		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row1 = mysqli_fetch_assoc($result);
		
         if ($num_rows > 0)
		{
		    
    		      $user_edit= "UPDATE tbl_order SET o_type='".$_POST['o_type']."' WHERE tbl_order.user_id='".$_POST['user_id']."' AND tbl_order.o_id='".$_POST['o_id']."' ";	 
    		    
                $result = mysqli_query($mysqli,$user_edit);

    	 
			$set['GROCERY_APP'][]=array('msg'=>'Successfully Updated','success'=>'1');
		}
		else
		{
				$set['GROCERY_APP'][]=array('msg'=>'Updated Fail','success'=>'0');	 
				
		}
			
		 	header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	
}


//get all settings
else if(isset($_GET['settings']))
 	{
  		 $jsonObj4= array();	

		$query="SELECT * FROM tbl_settings WHERE id='1'";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());


		while($data = mysqli_fetch_assoc($sql))
		{
			 
			$row['app_name'] = $data['app_name'];
			$row['app_logo'] = $data['app_logo'];
			$row['app_version'] = $data['app_version'];
			$row['app_author'] = $data['app_author'];
			$row['app_contact'] = $data['app_contact'];
			$row['app_email'] = $data['app_email'];
			$row['app_website'] = $data['app_website'];
			$row['app_description'] = $data['app_description'];
			$row['app_developed_by'] = $data['app_developed_by'];

			$row['app_privacy_policy'] = stripslashes($data['app_privacy_policy']);
 			
 			$row['publisher_id'] = $data['publisher_id'];
 			$row['interstital_ad'] = $data['interstital_ad'];
			$row['interstital_ad_id'] = $data['interstital_ad_id'];
 			$row['banner_ad'] = $data['banner_ad'];
 			$row['banner_ad_id'] = $data['banner_ad_id'];
			$row['rewarded_ad_id'] = $data['rewarded_ad_id'];
			
			array_push($jsonObj4,$row); 
			}
		
		$set['GROCERY_APP'] = $jsonObj4;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }
 
 //test
else if(isset($_GET['test']))
 	{
  		 $jsonObj4= array();	
  		 
  		   // JSON string
  $someJSON = '[{"sub_cat":1,"sub_sub_cat":2},{"sub_cat":1,"sub_sub_cat":3},{"sub_cat":2,"sub_sub_cat":2}]';

  // Convert JSON string to Array
  $someArray = json_decode($someJSON, true);

    for ($x = 0; $x <= count($someArray)-1 ; $x++) {
            
            
            $query1="SELECT * FROM tbl_sub_category WHERE sub_id='".$someArray[$x]["sub_cat"]."' ";
            $result1 = mysqli_query($mysqli,$query1);
            	$row1 = mysqli_fetch_assoc($result1);
            	$row2=$row1['sub_name'];
            
            $query2="SELECT * FROM tbl_sub_sub_category WHERE sub_sub_id='".$someArray[$x]["sub_cat"]."' ";
            $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row4=$row3['sub_sub_name'];
            
	        
            $employees[] = array('sub_cat'=> $row2,'sub_sub_cat'=> $row4);
            	
    }
    
     $jsonformat=json_encode($employees);

		$query="SELECT * FROM tbl_settings WHERE id='1'";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());


		
		$set['GROCERY_APP'] = $jsonObj4;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }


else if(isset($_GET['gettrendingProductList']))
 	{



		$jsonObj= array();	

	    $tableName="tbl_product";		
		$limit = 10; 
		
		$query = "SELECT COUNT(*) as num FROM $tableName where p_status=1";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
		$total_pages = $total_pages['num'];
		
		$stages = 3;
		$page=0;
		if(isset($_GET['page'])){
		$page = mysqli_real_escape_string($mysqli,$_GET['page']);
		}
		if($page){
			$start = ($page - 1) * $limit; 
		}else{
			$start = 0;	
			}
			
 		 $query="SELECT * FROM `tbl_product`
 LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id
where tbl_product.p_status=1 ORDER BY RAND() DESC LIMIT $start, $limit";
     


		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
				$someArray = json_decode($data['p_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {

            
            	//[{"no":"1","qty":"1","unit":"kg","dis_price":"100","ori_price":"200"},
            	
            $employees[$x]= array(
                                 'no'=> $someArray[$x]["no"],
                                   'qty'=> $someArray[$x]["qty"],
                                'unit'=> $someArray[$x]["unit"],
                                'dis_price'=> $someArray[$x]["dis_price"],
                                    'ori_price'=> $someArray[$x]["ori_price"]
                                );
		        }


					$row['p_id']=$data['p_id'];
			$row['c_id']=$data['c_id'];
			$row['c_name']=$data['c_name'];
	
			$row['p_name'] = $data['p_name'];
 			$row['p_desc'] = $data['p_desc'];
 			$row['Productdetails'] = $employees;
 			$row['p_image'] = $file_path.'images/'.$data['p_image'];
 				$row['p_stock'] = $data['p_stock'];
 			$row['p_status'] = $data['p_status'];
			
			array_push($jsonObj,$row);
		
		}
		
        $set['page'] = $_GET['page'];
        $set['totalimage'] = $total_pages;
        $set['limit'] = $limit;
        $set['success'] = '1';
		$set['GROCERY_APP'] = $jsonObj;	
		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

 	
}
	
	else if(isset($_GET['getsearchProductList']))
 	{

	    $jsonObj= array();	

		
		$tableName="tbl_product";		
		$limit = 10; 
		
		$query = "SELECT COUNT(*) as num FROM $tableName where tbl_product.p_status=1 and tbl_product.p_name like '%".addslashes($_GET['search_value'])."%'";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
		$total_pages = $total_pages['num'];
		
		$stages = 3;
		$page=0;
		if(isset($_GET['page'])){
		$page = mysqli_real_escape_string($mysqli,$_GET['page']);
		}
		if($page){
			$start = ($page - 1) * $limit; 
		}else{
			$start = 0;	
			}

 $query="SELECT * FROM `tbl_product`
 LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id
		where tbl_product.p_status = 1 and tbl_product.p_name like '%".addslashes($_GET['search_value'])."%' ORDER BY tbl_product.p_id DESC LIMIT $start, $limit";



		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

		$someArray = json_decode($data['p_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {

            
            	//[{"no":"1","qty":"1","unit":"kg","dis_price":"100","ori_price":"200"},
            $employees[$x]= array(
                                 'no'=> $someArray[$x]["no"],
                                   'qty'=> $someArray[$x]["qty"],
                                'unit'=> $someArray[$x]["unit"],
                                'dis_price'=> $someArray[$x]["dis_price"],
                                    'ori_price'=> $someArray[$x]["ori_price"]
                                );
        }

			$row['p_id']=$data['p_id'];
			$row['c_id']=$data['c_id'];
			$row['c_name']=$data['c_name'];
	
			$row['p_name'] = $data['p_name'];
 			$row['p_desc'] = $data['p_desc'];
 			$row['Productdetails'] = $employees;
 			$row['p_image'] = $file_path.'images/'.$data['p_image'];
 				$row['p_stock'] = $data['p_stock'];
 			$row['p_status'] = $data['p_status'];
			

			array_push($jsonObj,$row);
		
		}

       
        $set['page'] = $_GET['page'];
        $set['totalimage'] = $total_pages;
        $set['limit'] = '10';
        $set['success'] = '1';
		$set['GROCERY_APP'] = $jsonObj;	

 	
			header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}
	
//get all Product Banner with category wise
 else if(isset($_GET['get_product_banner']))
 	{


		$jsonObj1= array();
			
        
		 $query="SELECT * FROM `tbl_product_banner` 
		 LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product_banner.c_id 
		 WHERE tbl_product_banner.c_id='".$_POST['c_id']."'";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

          	$row['b_id'] = $data['b_id'];
           	$row['c_id'] = $data['c_id'];
           	$row['c_name'] = $data['c_name'];
          		$row['b_name'] = $data['b_name'];
			$row['b_image'] = $file_path.'images/'.$data['b_image'];
			$row['b_image_thumb'] = $file_path.'images/thumbs/'.$data['b_image'];
			$row['b_status'] = $data['b_status'];
		
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }
 
 
 else if(isset($_GET['get_notification']))
 	{


		$jsonObj1= array();
			
        
		 $query="SELECT * FROM `tbl_notification` 
		  WHERE tbl_notification.user_id='".$_GET['user_id']."' and tbl_notification.type='".$_GET['type']."'  
		 ORDER BY tbl_notification.id DESC";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

          	$row['id'] = $data['id'];
          	$row['type'] = $data['type'];
          		$row['order_id'] = $data['order_id'];
          	$row['user_id'] = $data['user_id'];
          	$row['date'] = $data['date'];
          		$row['msg'] = $data['msg'];
			$row['status'] =$data['status'];
		
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }
 
 
 
// -------------------------------------Admin App Apis-------------------------------------



 //add Category from Admid apps Api
else if(isset($_GET['add_cat']))
{
if($_POST['c_name']!="" and $_FILES['c_image']['name'] != "")
{
 		if($_FILES['c_image']['name'] != "")
			       	{	
					$image=rand(0,99999)."_".$_FILES['c_image']['name'];
			 	 
    		       //Main Image
    			   $tpath1='images/'.$image; 			 
    		       $pic1=compress_image($_FILES["c_image"]["tmp_name"], $tpath1, 80);
    			 
    				//Thumb Image 
    			   $thumbpath='images/thumbs/'.$image;		
    		       $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200'); 
		 		}
		 		else
		 		{
		 			$image = "";
		 		}
		    
  			$qry1="INSERT INTO tbl_category 
				  (`c_name`,
				  `c_image`,
				   c_status
				 
				) VALUES (
					'".trim($_POST['c_name'])."',
					'$image',
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_category WHERE c_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);

			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'c_id'	=>	$row['c_id'],
			'c_name' =>	$row['c_name'],
			'c_image'	=>$file_path.'images/'.$row['c_image'],
			'c_status'	=>	$row['c_status'],
			);
				
	
}else
    {
	$set['GROCERY_APP'][]=array('msg' => "Some error occured",'success'=>'0');
    }	
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}


//Update Category From Admin App Api
else if(isset($_GET['edit_cat']))
{
	
		$sql = "SELECT * FROM tbl_category where c_id = '".$_POST['c_id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);

	if($_FILES['c_image']['name'] != "")
		{	
			if($row['c_image'] !== "") 
			{
			 	unlink('images/'.$row['c_image']); 
			 	unlink('images/thumbs/'.$row['c_image']); 
			}

			$facility_image=rand(0,99999)."_".$_FILES['c_image']['name'];
		   //Main Image
		   	$tpath1='images/'.$facility_image; 		
			$pic1=compress_image($_FILES["c_image"]["tmp_name"], $tpath1, 80);
		 	$thumbpath='images/thumbs/'.$facility_image;		
	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 		}
 		else
 		{
 		$facility_image = "";
 		}

		
 if($_POST['c_name']!="")
		{
			$user_edit= "UPDATE tbl_category SET 
			c_name='".$_POST['c_name']."',
			c_image='".$facility_image."'

			WHERE c_id = '".$_POST['c_id']."'";	 
		
		}else{
		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}
	
   		
  			$user_res = mysqli_query($mysqli,$user_edit);	
	  	
			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//Delete Cat From Admin App Api
else if(isset($_GET['delete_cat']))
 	{

		$jsonObj= array();
 		$c_id=$_POST['c_id'];

		if($_POST['c_id'] != "") 
		{

		$qry = "SELECT * FROM tbl_category WHERE c_id='".$c_id."'"; 
			
		$result 	= mysqli_query($mysqli,$qry);
		$num_rows 	= mysqli_num_rows($result);
		
			if($num_rows > 0)
			{
			
				$delete = "DELETE FROM tbl_category where c_id = '".$c_id."'";
				$result1 = mysqli_query($mysqli,$delete);

				if($result1 == 1)
					$set['GROCERY_APP'][]=array('msg' => "Category deleted successfully...!",'success'=>'1');
				else
					$set['GROCERY_APP'][]=array('msg' => "Some error occured",'success'=>'0');
				

			}
			else
			{	
				$set['GROCERY_APP'][]=array('msg' => " Category Not  found ",'success'=>'0');
			} 
 	
	}
	else
		{
			$set['GROCERY_APP'][]=array('msg' => "Please enter Category id",'success'=>'0');
		}	 
			header( 'Content-Type: application/json; charset=utf-8' );
 	   		echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
 			die();
		
		}
		
//Get All Category From Admin App Api
else if(isset($_GET['get_cat']))
{

		$jsonObj1= array();
			

		 $query="SELECT * FROM tbl_category where tbl_category.c_id and tbl_category.c_status='1' ORDER BY tbl_category.c_id";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

			$row['c_id'] = $data['c_id'];
			$row['c_name'] = $data['c_name'];
			$row['c_image'] = $file_path.'images/'.$data['c_image'];
			$row['c_image_thumb'] = $file_path.'images/thumbs/'.$data['c_image'];
			$row['c_status'] = $data['c_status'];
		
 
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}


// //Add sub category
// else if(isset($_GET['add_subcat']))
// {

//  		if($_FILES['sub_image']['name'] != "")
// 			       	{	
// 					$image=rand(0,99999)."_".$_FILES['sub_image']['name'];
			 	 
//     		       //Main Image
//     			   $tpath1='images/'.$image; 			 
//     		       $pic1=compress_image($_FILES["sub_image"]["tmp_name"], $tpath1, 80);
    			 
//     				//Thumb Image 
//     			   $thumbpath='images/thumbs/'.$image;		
//     		       $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200'); 
// 		 		}
// 		 		else
// 		 		{
// 		 			$image = "";
// 		 		}
		    
//   			$qry1="INSERT INTO tbl_sub_category 
// 				  (
// 				  `sub_name`,
// 				   sub_image,
// 				   sub_status
				 
// 				) VALUES (
				
// 					'".trim($_POST['sub_name'])."',
// 					'$image',
// 					1
// 				)"; 
            
//             $result1=mysqli_query($mysqli,$qry1);  									 
		
// 			 $last_id = mysqli_insert_id($mysqli); 
 

// 			$qrys = "SELECT * FROM tbl_sub_category WHERE sub_id = '".$last_id."'"; 
// 			$results = mysqli_query($mysqli,$qrys);
// 			$row = mysqli_fetch_assoc($results);

// 			$set['GROCERY_APP'][]	=	array( 
// 			'msg' =>	" Successful",
// 			'success'=>'1',
// 			'sub_id'	=>	$row['sub_id'],
// 			'sub_name' =>	$row['sub_name'],
// 			'sub_image'	=>$file_path.'images/'.$row['sub_image'],
// 			'sub_status'	=>	$row['sub_status'],
// 			);
				
	
	

		
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();
// }

// //edit SubCategory 
// else if(isset($_GET['edit_subcat']))
// {
	
// 		$sql = "SELECT * FROM tbl_sub_category where sub_id = '".$_POST['sub_id']."' ";
// 		$res = mysqli_query($mysqli,$sql);
// 		$row = mysqli_fetch_assoc($res);

// 	if($_FILES['sub_image']['name'] != "")
// 		{	
// 			if($row['sub_image'] !== "") 
// 			{
// 			 	unlink('images/'.$row['sub_image']); 
// 			 	unlink('images/thumbs/'.$row['sub_image']); 
// 			}

// 			$facility_image=rand(0,99999)."_".$_FILES['sub_image']['name'];
// 		   //Main Image
// 		   	$tpath1='images/'.$facility_image; 		
// 			$pic1=compress_image($_FILES["sub_image"]["tmp_name"], $tpath1, 80);
// 		 	$thumbpath='images/thumbs/'.$facility_image;		
// 	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
//  		}
//  		else
//  		{
//  		$facility_image = "";
//  		}

		
//  if($_POST['sub_name']!="")
// 		{
// 			$user_edit= "UPDATE tbl_sub_category SET
// 			sub_name='".$_POST['sub_name']."',
// 			sub_image='".$facility_image."'

// 			WHERE sub_id = '".$_POST['sub_id']."'";	 
		
// 		}else{
// 		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
// 		}
	
   		
//   			$user_res = mysqli_query($mysqli,$user_edit);	
	  	
// 			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();
// }

// //Delete Sub Category From Admin App Api
// else if(isset($_GET['delete_subcat']))
//  	{

// 		$jsonObj= array();
//  		$sub_id=$_POST['sub_id'];

// 		if($_POST['sub_id'] != "") 
// 		{

// 		$qry = "SELECT * FROM tbl_sub_category WHERE sub_id='".$sub_id."'"; 
			
// 		$result 	= mysqli_query($mysqli,$qry);
// 		$num_rows 	= mysqli_num_rows($result);
		
// 			if($num_rows > 0)
// 			{
			
// 				$delete = "DELETE FROM tbl_sub_category where sub_id = '".$sub_id."'";
// 				$result1 = mysqli_query($mysqli,$delete);

// 				if($result1 == 1)
// 					$set['GROCERY_APP'][]=array('msg' => "Sub Category deleted successfully...!",'success'=>'1');
// 				else
// 					$set['GROCERY_APP'][]=array('msg' => "Some error occured",'success'=>'0');
				

// 			}
// 			else
// 			{	
// 				$set['GROCERY_APP'][]=array('msg' => " Category Not  found ",'success'=>'0');
// 			} 
 	
// 	}
// 	else
// 		{
// 			$set['GROCERY_APP'][]=array('msg' => "Please enter Category id",'success'=>'0');
// 		}	 
// 			header( 'Content-Type: application/json; charset=utf-8' );
//  	   		echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
//  			die();
		
// 		}
		
// //Get All Sub Category
// else if(isset($_GET['get_subcat']))
//  	{


// 		$jsonObj1= array();
			
        
// 		 $query="SELECT * FROM `tbl_sub_category` 
// 		 order by tbl_sub_category.c_id desc";
// 		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

// 		while($data = mysqli_fetch_assoc($sql))
// 		{

// 			$row['sub_id'] = $data['sub_id'];
// // 			$row['c_id']=$data['c_id'];
// // 			$row['c_name']=$data['c_name'];
// 			$row['sub_name'] = $data['sub_name'];
// 			$row['sub_category_image'] = $file_path.'images/'.$data['sub_image'];
// 			$row['sub_category_image_thumb'] = $file_path.'images/thumbs/'.$data['sub_image'];
//  			$row['sub_status'] = $data['sub_status'];
// 			array_push($jsonObj1,$row);

		
// 		}
		
// 		$set['GROCERY_APP'] = $jsonObj1;	

		
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();
//  }
 
 //Add Product
 else if(isset($_GET['add_product']))
{

 		if($_FILES['p_image']['name'] != "")
			       	{	
					$image=rand(0,99999)."_".$_FILES['p_image']['name'];
			 	 
    		       //Main Image
    			   $tpath1='images/'.$image; 			 
    		       $pic1=compress_image($_FILES["p_image"]["tmp_name"], $tpath1, 80);
    			 
    				//Thumb Image 
    			   $thumbpath='images/thumbs/'.$image;		
    		       $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200'); 
		 		}
		 		else
		 		{
		 			$image = "";
		 		}


  			 $qry1="INSERT INTO `tbl_product`( `c_id`, `p_name`, `p_desc`, `p_details`, `p_image`, `p_stock`, `p_status`)
				   VALUES (
				
					'".trim($_POST['c_id'])."',
					'".trim($_POST['p_name'])."',
					'".trim($_POST['p_desc'])."',
					'".trim($_POST['p_details'])."',
					'$image',
					0,
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 
// INSERT INTO `tbl_product`(`p_id`, `c_id`, `p_name`, `p_desc`, `p_details`, `p_image`, `p_stock`, `p_status`)

			$qrys = "SELECT * FROM tbl_product WHERE p_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);

			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'p_id'	=>	$row['p_id'],
			'c_id'=>	$row['c_id'],
			'p_name' =>	$row['p_name'],
			'p_desc' =>$row['p_desc'],
			'p_details' =>$row['p_details'],
			'p_image'	=>$file_path.'images/'.$row['p_image'],
			
				'p_stock'	=>	$row['p_stock'],
			'p_status'	=>	$row['p_status'],
			);
				
	
	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//edit product
else if(isset($_GET['edit_product']))
{
	
		$sql = "SELECT * FROM tbl_product where p_id = '".$_POST['p_id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);

	if($_FILES['p_image']['name'] != "")
		{	
			if($row['p_image'] !== "") 
			{
			 	unlink('images/'.$row['p_image']); 
			 	unlink('images/thumbs/'.$row['p_image']); 
			}

			$facility_image=rand(0,99999)."_".$_FILES['p_image']['name'];
		   //Main Image
		   	$tpath1='images/'.$facility_image; 		
			$pic1=compress_image($_FILES["p_image"]["tmp_name"], $tpath1, 80);
		 	$thumbpath='images/thumbs/'.$facility_image;		
	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 		}
 		else
 		{
 		$facility_image = "";
 		}

		
 if($_POST['p_name']!="")
		{
			$user_edit= "UPDATE tbl_product SET
			c_id='".$_POST['c_id']."',
			p_name='".$_POST['p_name']."',
			p_desc='".$_POST['p_desc']."',
			p_details='".$_POST['p_details']."',
			p_image='".$facility_image."'
			WHERE p_id = '".$_POST['p_id']."'";	 
		
		}else{
		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}
	
   		
   			$user_res = mysqli_query($mysqli,$user_edit);	
	  	
			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}


//Delete Sub Category
else if(isset($_GET['delete_product']))
 	{

		$jsonObj= array();
 		$p_id=$_POST['p_id'];

		if($_POST['p_id'] != "") 
		{

		$qry = "SELECT * FROM tbl_product WHERE p_id='".$p_id."'"; 
			
		$result 	= mysqli_query($mysqli,$qry);
		$num_rows 	= mysqli_num_rows($result);
		
			if($num_rows > 0)
			{
			
				$delete = "DELETE FROM tbl_product where p_id = '".$p_id."'";
				$result1 = mysqli_query($mysqli,$delete);

				if($result1 == 1)
					$set['GROCERY_APP'][]=array('msg' => "Product deleted successfully...!",'success'=>'1');
				else
					$set['GROCERY_APP'][]=array('msg' => "Some error occured",'success'=>'0');
				

			}
			else
			{	
				$set['GROCERY_APP'][]=array('msg' => " Product Not  found ",'success'=>'0');
			} 
 	
	}
	else
		{
			$set['GROCERY_APP'][]=array('msg' => "Please enter Product id",'success'=>'0');
		}	 
			header( 'Content-Type: application/json; charset=utf-8' );
 	   		echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
 			die();
		
}

//get all product
 else if(isset($_GET['get_products']))
 	{


  		  		$jsonObj4= array();
			
 		  $tableName="tbl_product";   
	      $limit = 10; 
	      
	      $query = "SELECT COUNT(*) as num FROM $tableName
	      WHERE tbl_product.c_id='".$_GET['c_id']."' and p_status = 1 
	      ORDER BY tbl_product.p_id";
	      
	      $total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
	      $total_pages = $total_pages['num'];
	      
	      $stages = 3;
	      $page=0;
	      if(isset($_GET['page'])){
	      $page = mysqli_real_escape_string($mysqli,$_GET['page']);
	      }
	      if($page){
	        $start = ($page - 1) * $limit; 
	      }else{
	        $start = 0; 
	        } 
	
		 $query="SELECT * FROM `tbl_product`
 LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id
WHERE tbl_product.c_id='".$_GET['c_id']."' and tbl_product.p_status = 1 
LIMIT $start, $limit";		
        

		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

	$someArray = json_decode($data['p_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {

            
            	//[{"no":"1","qty":"1","unit":"kg","dis_price":"100","ori_price":"200"},
            $employees[$x]= array(
                                 'no'=> $someArray[$x]["no"],
                                   'qty'=> $someArray[$x]["qty"],
                                'unit'=> $someArray[$x]["unit"],
                                'dis_price'=> $someArray[$x]["dis_price"],
                                    'ori_price'=> $someArray[$x]["ori_price"]
                                );
        }

			$row['p_id']=$data['p_id'];
			$row['c_id']=$data['c_id'];
			$row['c_name']=$data['c_name'];
		
			$row['p_name'] = $data['p_name'];
 			$row['p_desc'] = $data['p_desc'];
 			$row['Productdetails'] = $employees;
 			$row['p_image'] = $file_path.'images/'.$data['p_image'];


 				$row['p_stock'] = $data['p_stock'];
 			$row['p_status'] = $data['p_status'];
			array_push($jsonObj4,$row);

		
		}
		
	
		$set['page'] = $_GET['page'];
		$set['totalimage'] = $total_pages;
		$set['limit'] = $limit;
		$set['success'] = '1';
		$set['GROCERY_APP'] = $jsonObj4;



		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }
 
 //get order
 
//get all order
else if(isset($_GET['get_orders']))
{


		$jsonObj1= array();
	
		  $query="SELECT * FROM `tbl_order`
left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
ORDER BY tbl_order.o_id DESC";


		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{

        	$someArray = json_decode($data['order_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {
                

           
            
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	   $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            
            	
            $employees[$x]= array(
                                 'cat_id'=> $someArray[$x]["category"],
                                'cat'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                     'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                );
                // $employees[$x]= array('category_id'=> $someArray[$x]["category"],
                //                 'category'=> $row6,
                //                  'sub_cat_id'=> $someArray[$x]["sub_cat"],
                //                 'sub_cat'=> $row2,
                //                   'product_id'=> $someArray[$x]["product"],
                //                 'product'=> $row_name,
                //                 'qunt'=> $someArray[$x]["qunt"],
                //                 'p_ori_price'=> $someArray[$x]["p_ori_price"],
                //                 'p_dis_price'=> $p_dis_price,
                //                 'p_unit'=> $p_unit,
                //                 'p_image'=> $p_image,
                //                   'p_qty'=> $p_qty
                                    
                //                 );
          

			$row['o_id'] = $data['o_id'];
			$row['user_id'] = $data['user_id'];
			$row['f_name'] = $data['f_name'];
			$row['order_details'] = $employees;
			$row['a_id'] = $data['a_id'];
			$row['a_name'] = $data['a_name'];
			$row['a_number'] = $data['a_number'];
			$row['a_houser_no'] = $data['a_houser_no'];
			$row['a_lendmark'] = $data['a_lendmark'];
			$row['a_adderss'] = $data['a_adderss'];
			$row['o_cdate'] = $data['o_cdate'];
			$row['o_date'] = $data['o_date'];
			$row['o_time'] = $data['o_time'];
			$row['o_amount'] = $data['o_amount'];
			$row['o_type'] = $data['o_type'];
		
			$row['o_status'] = $data['o_status'];
			
            }
            
			 array_push($jsonObj1,$row);
                	
            }
            
		  		 

	
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//get all order
else if(isset($_GET['get_orders1']))
{
    
    		$jsonObj1= array();
    		

		  $tableName="tbl_order";   
	      $limit = 20; 
	      
	      $query = "SELECT COUNT(*) as num FROM $tableName ";
	      
	      $total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
	      $total_pages = $total_pages['num'];
	      
	      $stages = 3;
	      $page=0;
	      if(isset($_GET['page'])){
	      $page = mysqli_real_escape_string($mysqli,$_GET['page']);
	      }
	      if($page){
	        $start = ($page - 1) * $limit; 
	      }else{
	        $start = 0; 
	        } 
    
	
		  $query="SELECT * FROM `tbl_order`
left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
LEFT JOIN tbl_category ON tbl_category.c_id=tbl_order.order_details
left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
ORDER BY tbl_order.o_id DESC LIMIT $start, $limit";


		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{

        	$someArray = json_decode($data['order_details'], true);
        	
           $response = array();    

            for ($x = 0; $x <= count($someArray) - 1 ; $x++) {
                

            $query1="SELECT * FROM tbl_sub_category WHERE sub_id='".$someArray[$x]["sub_cat"]."' ";
            $result1 = mysqli_query($mysqli,$query1);
            	$row1 = mysqli_fetch_assoc($result1);
            	$row2=$row1['sub_name'];
       
            
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	   $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            
            	
            $employees = array('category_id'=> $someArray[$x]["category"],
                                'category'=> $row6,
                                 'sub_cat_id'=> $someArray[$x]["sub_cat"],
                                'sub_cat'=> $row2,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                       'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                );
    
                    array_push($response, $employees);            
                 
             }
			$row['o_id'] = $data['o_id'];
			$row['user_id'] = $data['user_id'];
			$row['f_name'] = $data['f_name'];
			$row['l_name'] = $data['l_name'];
			$row['mobile'] = $data['mobile'];
			$row['order_details'] = $response;
			$row['a_id'] = $data['a_id'];
			$row['a_name'] = $data['a_name'];
			$row['a_number'] = $data['a_number'];
			$row['a_houser_no'] = $data['a_houser_no'];
			$row['a_lendmark'] = $data['a_lendmark'];
			$row['a_adderss'] = $data['a_adderss'];
			$row['o_cdate'] = $data['o_cdate'];
			$row['o_date'] = $data['o_date'];
			$row['o_time'] = $data['o_time'];
			$row['o_amount'] = $data['o_amount'];
			$row['o_type'] = $data['o_type'];
		
			
			$row['o_status'] = $data['o_status'];
			
       
			 array_push($jsonObj1,$row);
                	
            }
            
		  		 

		$set['page'] = $_GET['page'];
		$set['totalimage'] = $total_pages;
		$set['limit'] = $limit;
		$set['success'] = '1';
	
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//get all order
else if(isset($_GET['get_orders_search_status']))
{
    
    		$jsonObj1= array();
    		
    		$o_type = $_GET['o_type'] ;
    	

		  $tableName="tbl_order";   
	      $limit = 10; 
	      
	       $query = "SELECT COUNT(*) as num FROM $tableName 
	                       left join tbl_coupon on tbl_coupon.cpn_id = tbl_order.cpn_id
	         left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
        left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
                where tbl_order.o_type = '".$o_type."' ";
	      
	      $total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
	      $total_pages = $total_pages['num'];
	      
	      $stages = 3;
	      $page=0;
	      
	      if(isset($_GET['page'])){
	      $page = mysqli_real_escape_string($mysqli,$_GET['page']);
	      }
	      if($page){
	        $start = ($page - 1) * $limit; 
	      }else{
	        $start = 0; 
	        }
    
	
		   $query="SELECT * FROM `tbl_order`
        left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
             left join tbl_coupon on tbl_coupon.cpn_id = tbl_order.cpn_id
        left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id           
        where tbl_order.o_type = '".$o_type."' 
        ORDER BY tbl_order.o_id DESC LIMIT $start, $limit";


		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{
          
          $response = array();    


        	$someArray = json_decode($data['order_details'], true);
  
           $count = count($someArray) - 1; 

            for ($x = 0; $x <= $count ; $x++) 
            {
                
                
                
                
            
       
          
            
            //              $query1="SELECT * FROM tbl_sub_category WHERE sub_id='".$someArray[$x]["sub_cat"]."' ";
            //     $result1 = mysqli_query($mysqli,$query1);
            // 	$row1 = mysqli_fetch_assoc($result1);
            // 	$row2=$row1['sub_name'];
            	
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_ori_price=$row3['p_ori_price'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	$query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
                $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            
            	
           $employees = array(
                                 'cat_id'=> $someArray[$x]["category"],
                                'cat'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                );
                                
           
                                
                  array_push($response, $employees);            
                                

       	
            }     
                        
            
            
    			$row['o_id'] = $data['o_id'];
    			
    			$row['user_id'] = $data['user_id'];
    			$row['f_name'] = $data['f_name'];
    			$row['l_name'] = $data['l_name'];
    			$row['mobile'] = $data['mobile'];
    		
    				$row['order_details'] = $response;
    			$row['a_id'] = $data['a_id'];
    			$row['a_name'] = $data['a_name'];
    			$row['a_number'] = $data['a_number'];
    			$row['a_houser_no'] = $data['a_houser_no'];
    			$row['a_lendmark'] = $data['a_lendmark'];
    			$row['a_adderss'] = $data['a_adderss'];
    			$row['o_cdate'] = $data['o_cdate'];
    			$row['o_date'] = $data['o_date'];
    			$row['o_time'] = $data['o_time'];
    			$row['o_amount'] = $data['o_amount'];
    			$row['o_type'] = $data['o_type'];
  
	if($data['cpn_id'] == 0 )
			{
			    $row['cpn_id']=0;
			    $row['cpn_name']='';
			    $row['cpn_price']=0;
			}else
			{
			  	$row['cpn_id'] = $data['cpn_id'];
			                $row['cpn_name'] = $data['cpn_name'];
		                	$row['cpn_price'] = $data['cpn_price'];
		                
			}
				$row['o_txtfinalamount'] = $data['o_txtfinalamount'];
    			$row['payment_type'] = $data['payment_type'];
			$row['payment_orderid'] = $data['payment_orderid'];
    			$row['o_status'] = $data['o_status'];
    			
     
 
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		$set['page'] = $_GET['page'];
		$set['totalimage'] = $total_pages;
		$set['limit'] = $limit;
		$set['success'] = '1';
	
		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}
		
//get all order demo
else if(isset($_GET['get_orders_search_status_demo']))
{
    
    		$jsonObj1= array();
    		
    		$o_type = $_GET['o_type'] ;
    	

		  $tableName="tbl_order";   
	      $limit = 10; 
	      
	       $query = "SELECT COUNT(*) as num FROM $tableName where tbl_order.o_type = '".$o_type."' ";
	      
	      $total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
	      $total_pages = $total_pages['num'];
	      
	      $stages = 3;
	      $page=0;
	      
	      if(isset($_GET['page'])){
	      $page = mysqli_real_escape_string($mysqli,$_GET['page']);
	      }
	      if($page){
	        $start = ($page - 1) * $limit; 
	      }else{
	        $start = 0; 
	        }
    
	
		   $query="SELECT * FROM `tbl_order`
        left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
        left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
        where tbl_order.o_type = '".$o_type."' 
        ORDER BY tbl_order.o_id DESC LIMIT $start, $limit";


		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{
          
          $response = array();    


        	$someArray = json_decode($data['order_details'], true);
  
           $count = count($someArray) - 1; 

            for ($x = 0; $x <= $count ; $x++) 
            {
                
                
                if ($someArray[$x]["category"]  == $_GET['cat'] )
                {
                
            	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            		$p_id=$row3['p_id'];
            	$row_name=$row3['p_name'];
       
          
            
            //              $query1="SELECT * FROM tbl_sub_category WHERE sub_id='".$someArray[$x]["sub_cat"]."' ";
            //     $result1 = mysqli_query($mysqli,$query1);
            // 	$row1 = mysqli_fetch_assoc($result1);
            // 	$row2=$row1['sub_name'];
            	
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_ori_price=$row3['p_ori_price'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	$query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
                $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            
            	
           $employees = array(
                                 'cat_id'=> $someArray[$x]["category"],
                                'cat'=> $row2,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                       'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                );
                                
           
                                
                  array_push($response, $employees);            
                                

       	
                }   
            }
                        
            
            
    			$row['o_id'] = $data['o_id'];
    			
    			$row['user_id'] = $data['user_id'];
    			$row['f_name'] = $data['f_name'];
    			$row['l_name'] = $data['l_name'];
    			$row['mobile'] = $data['mobile'];
    		
    				$row['order_details'] = $response;
    			$row['a_id'] = $data['a_id'];
    			$row['a_name'] = $data['a_name'];
    			$row['a_number'] = $data['a_number'];
    			$row['a_houser_no'] = $data['a_houser_no'];
    			$row['a_lendmark'] = $data['a_lendmark'];
    			$row['a_adderss'] = $data['a_adderss'];
    			$row['o_cdate'] = $data['o_cdate'];
    			$row['o_date'] = $data['o_date'];
    			$row['o_time'] = $data['o_time'];
    			$row['o_amount'] = $data['o_amount'];
    			$row['o_type'] = $data['o_type'];
    		
    			$row['o_status'] = $data['o_status'];
    			
     
 
		    	array_push($jsonObj1,$row);
            
		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		$set['page'] = $_GET['page'];
		$set['totalimage'] = $total_pages;
		$set['limit'] = $limit;
		$set['success'] = '1';
	
		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//old API
/* else if(isset($_GET['status_manage_order']))
{


            $qry = "SELECT * FROM `tbl_order`
        left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
        WHERE tbl_order.o_id='".$_POST['o_id']."' ";

		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row1 = mysqli_fetch_assoc($result);
		
         if ($num_rows > 0)
		{
		    
    	    $user_edit= "UPDATE tbl_order SET o_type='".$_POST['o_type']."' WHERE tbl_order.o_id='".$_POST['o_id']."' ";	 
    	    
            $result = mysqli_query($mysqli,$user_edit);
            
            
           $qry1 = "SELECT * FROM `tbl_registration`
        WHERE tbl_registration.id='".$_POST['user_id']."' ";

		$result1 = mysqli_query($mysqli,$qry1);
		$row2 = mysqli_fetch_assoc($result1);
	
       
             if($_POST['o_type'] == 2)
            {
                 $tokens = $row2['token'];
                $body = "Your order is accpeted";
                send_notification($tokens,$body);

    			   
            }


             if($_POST['o_type'] == 3)
            {
                 $tokens = $row2['token'];
                $body = "Your order is Rejected";
                send_notification($tokens,$body);

    			   
            }
            
                  if($_POST['o_type'] == 4)
            {
                 $tokens = $row2['token'];
                $body = "Your order is Delivered";
                send_notification($tokens,$body);

    			   
            }
            
    	 
			$set['GROCERY_APP'][]=array('msg'=>'Successfully Updated','success'=>'1');
		}
		else
		{
				$set['GROCERY_APP'][]=array('msg'=>'Updated Fail','success'=>'0');	 
				
		}
			
		 	header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	
}*/

 else if(isset($_GET['status_manage_order']))
{


        $qry = "SELECT * FROM `tbl_order`
        left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
        WHERE tbl_order.o_id='".$_POST['o_id']."' ";

		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row1 = mysqli_fetch_assoc($result);
		
         if ($num_rows > 0)
		{
		    
    	    $user_edit= "UPDATE tbl_order SET o_type='".$_POST['o_type']."' WHERE tbl_order.o_id='".$_POST['o_id']."' ";	 
    	    
            $result = mysqli_query($mysqli,$user_edit);
            
            
                $qry2 = "SELECT * FROM `tbl_registration`
                WHERE tbl_registration.id= 1 ";
        		$result2 = mysqli_query($mysqli,$qry2);
        		$row2 = mysqli_fetch_assoc($result2);
        	
        	
        	    $qry3 = "SELECT * FROM `tbl_registration`
                WHERE tbl_registration.id='".$_POST['user_id']."' ";
        		$result3 = mysqli_query($mysqli,$qry3);
        		$row3 = mysqli_fetch_assoc($result3);
	  
               
                     if($_POST['o_type'] == 2)
                    {
                         $tokens = $row3['token'];
                          $name = $row3['f_name'];
						 $v_name ="Grocery Store";
						 $o_date = $row1['o_date'];
						  $o_time = $row1['o_time'];
  $o_id = $_POST['o_id'];
                       
					   $body = "Hello " .$name. ",  your booking request with ID " .$_POST['o_id']. " has been ACCEPTED by " .$v_name." and is scheduled for " .$o_date." at ".$o_time. ". We wish you have a pleasant experience. "; 
					   
					     send_notification($tokens,$body,$o_id);
            			   $date = date("M-d-Y h:i:s");      

                        $data = array(
                            	'type'  => 1,
							'order_id'=>$_POST['o_id'],
                				'user_id'=>$_POST['user_id'],
                					'date'=>$date,
                			'msg'  =>  $body,
                			'status'  => 1,
                			);
                
                			$qry = Insert('tbl_notification',$data);
        
            			   
                    }
        
        
                     if($_POST['o_type'] == 3)
                    {
                           $tokens = $row3['token'];
                          $name = $row3['f_name'];
						 $v_name ="Grocery Store";
						 $o_date = $row1['o_date'];
						  $o_time = $row1['o_time'];
  $o_id = $_POST['o_id'];

					 $body = "Hello " .$name. ", unfortunately ".$v_name." has REJECTED your booking request with ID " .$_POST['o_id']. " was scheduled for " .$o_date." at ".$o_time. "."; 
					 
					    send_notification($tokens,$body,$o_id);
            			   $date = date("M-d-Y h:i:s");      

                        $data = array(
                            	'type'  => 1,
							'order_id'=>$_POST['o_id'],
                				'user_id'=>$_POST['user_id'],
                					'date'=>$date,
                			'msg'  =>  $body,
                			'status'  => 1,


                			);
                
                			$qry = Insert('tbl_notification',$data);
                    }
                    
                    if($_POST['o_type'] == 4)
                    {
                      $tokens = $row3['token'];
                          $name = $row3['f_name'];
						 $v_name ="Grocery Store";
						 $o_date = $row1['o_date'];
						  $o_time = $row1['o_time'];
  $o_id = $_POST['o_id'];
                        
                       $body = "Hello " .$name. ",  your booking request with ID " .$_POST['o_id']. " has been DELIVERED by " .$v_name." which was scheduled for " .$o_date." at ".$o_time. ". Please rate the your experience with the vendor. Ratings helps our vendors to serve you better. Thank You ! "; 
					   
					    send_notification($tokens,$body,$o_id);
            			   $date = date("M-d-Y h:i:s");      

                        $data = array(
                            	'type'  => 1,
							'order_id'=>$_POST['o_id'],
                				'user_id'=>$_POST['user_id'],
                					'date'=>$date,
                			'msg'  =>  $body,
                			'status'  => 1,


                			);
                
                			$qry = Insert('tbl_notification',$data);
                    }
            
    	 
			$set['GROCERY_APP'][]=array('msg'=>'Successfully Updated','success'=>'1');
		}
		else
		{
				$set['GROCERY_APP'][]=array('msg'=>'Updated Fail','success'=>'0');	 
				
		}
			
		 	header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	
}


 else if(isset($_GET['count_record']))
{
	$jsonObj1= array();



   $qry = "SELECT
  (SELECT COUNT(*) FROM tbl_category ORDER BY tbl_category.c_id) as category,
  (SELECT COUNT(*) FROM tbl_product ORDER BY tbl_product.p_id) as product,
  (SELECT COUNT(*) FROM tbl_order ORDER BY tbl_order.o_id) as orders,
  (SELECT COUNT(*) FROM tbl_registration ORDER BY tbl_registration.id) as user,
   (SELECT COUNT(*) FROM tbl_order  WHERE NOW() =  tbl_order.o_date) as todayorders
  
  ";

	
      $sql = mysqli_query($mysqli,$qry)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
   date_default_timezone_set('Asia/Calcutta');
 			  $newDateTime2 = date("h:i:s");
  						 
     			$openTime = $data['o_date'];
 			  
 			    
			if ($newDateTime2 = $openTime) 
			{
  			
 				 $qq=1;
 				
			}else
			{
				$q="SELECT * FROM tbl_order";
				
				$qq=$data['todayorders'];
 				
			}
 


			$row['Sub Category Total_Record']=$data['category'];
			$row['Product Total_Record']=$data['product'];
			$row['Users Total_Record']=$data['user'];
			$row['Order Total_Record']=$data['orders'];
			$row['Today`s Order Total_Record']=$qq;
			
			 array_push($jsonObj1,$row);

		}
	
			$set['GROCERY_APP'] = $jsonObj1;
		
		 	header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	

}


//get all settings
else if(isset($_GET['get_users']))
 	{
  		 $jsonObj4= array();	

		$query="SELECT * FROM tbl_registration ORDER BY tbl_registration.id";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());


		while($data = mysqli_fetch_assoc($sql))
		{
			 
			$row['id'] = $data['id'];
			$row['f_name'] = $data['f_name'];
			$row['l_name'] = $data['l_name'];
			$row['password'] = $data['password'];
			$row['dob'] = $data['dob'];
			$row['gender'] = $data['gender'];
			$row['country'] = $data['country'];
			$row['mobile'] = $data['mobile'];
			$row['email'] = $data['email'];
 
 			$row['image'] =$file_path.'images/'. $data['image'];
 			$row['wallet'] = $data['wallet'];
			$row['status'] = $data['status'];


			array_push($jsonObj4,$row); 
			}
		
		$set['GROCERY_APP'] = $jsonObj4;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }
 
 //add banner
 else if(isset($_GET['add_banner']))
 	{
 	    
 	   
 	if($_POST['b_name']!="" && $_FILES['b_image']['name']!="")
			{
			    
			      $banner_image=rand(0,99999)."_".$_FILES['b_image']['name'];
       
       //Main Image
     $tpath1='images/'.$banner_image;        
       $pic1=compress_image($_FILES["b_image"]["tmp_name"], $tpath1, 80);
   
    //Thumb Image 
     $thumbpath='images/thumbs/'.$banner_image;   
       $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 
					$qry1="INSERT INTO tbl_banner 
				  (b_name,
				  b_image,
				   b_status

				 
				) VALUES (
					'".$_POST['b_name']."',
					'".$banner_image."',
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_banner WHERE b_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);



			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'b_id'	=>	$row['b_id'],
			'b_name' =>	$row['b_name'],
			'b_image' =>$file_path.'images/'.$row['b_image'],
			'b_status'	=>	$row['b_status'],

			);
			}else
			{
				$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
			}
  			
	
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}
 
 
 
 
 //get all Banner 
else if(isset($_GET['get_banners']))
{

		$jsonObj1= array();
			

		 $query="SELECT * FROM tbl_banner ORDER BY tbl_banner.b_id DESC";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

			$row['b_id'] = $data['b_id'];
				$row['b_name'] = $data['b_name'];
			$row['b_image'] = $file_path.'images/'.$data['b_image'];
			$row['b_image_thumb'] = $file_path.'images/thumbs/'.$data['b_image'];
			$row['b_status'] = $data['b_status'];
		
 
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//edit address
else if(isset($_GET['Updatebanner']))
{
			$sql = "SELECT * FROM tbl_banner where b_id = '".$_POST['b_id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);

			
			
	if($_FILES['b_image']['name'] != "")
		{	
			if($row['b_image'] !== "") 
			{
			 	unlink('images/'.$row['b_image']); 
			 	unlink('images/thumbs/'.$row['b_image']); 
			}

			$facility_image=rand(0,99999)."_".$_FILES['b_image']['name'];
		   //Main Image
		   	$tpath1='images/'.$facility_image; 		
			$pic1=compress_image($_FILES["b_image"]["tmp_name"], $tpath1, 80);
		 	$thumbpath='images/thumbs/'.$facility_image;		
	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 		}
 		else
 		{
 			(($row['b_image'] !== "") ? $facility_image = $row['b_image'] : $facility_image = "");
 		}

		
 if($_POST['b_name']!="")
		{
			$user_edit="UPDATE `tbl_banner` SET 
		    `b_name`='".$_POST['b_name']."',
		    `b_image`='".$facility_image."'
		    
		    WHERE `b_id`='".$_POST['b_id']."'";	 
		
		}else{
		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}
	
   		
   			$user_res = mysqli_query($mysqli,$user_edit);	
	  	
			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}



//delete address
else if(isset($_GET['Deletebanner']))
 	{

		$jsonObj= array();
 		$b_id=$_POST['b_id'];

		if($_POST['b_id'] != "") 
		{

		$qry = "SELECT * FROM tbl_banner WHERE b_id='".$b_id."'"; 
			
		$result 	= mysqli_query($mysqli,$qry);
		$num_rows 	= mysqli_num_rows($result);
			//$row = mysqli_fetch_array($result);
			
			if($num_rows > 0)
			{
			
				$delete = "DELETE FROM tbl_banner where b_id = '".$b_id."'";
				$result1 = mysqli_query($mysqli,$delete);

				if($result1 == 1)
					$set['GROCERY_APP'][]=array('msg' => "Banner deleted successfully...!",'success'=>'1');
				else
					$set['GROCERY_APP'][]=array('msg' => "Some error occured",'success'=>'0');
				

			}
			else
			{	
				$set['GROCERY_APP'][]=array('msg' => "Data Not  found ",'success'=>'0');
			} 
 	
	}
	else
		{
			$set['GROCERY_APP'][]=array('msg' => "Please enter banner id",'success'=>'0');
		}	 
			header( 'Content-Type: application/json; charset=utf-8' );
 	   		echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
 			die();
		
		}
		
		
		
		
else if(isset($_GET['add_orders']))
{

	if($_POST['user_id']!="" and $_POST['order_details']!="" and $_POST['a_id']!="" and $_POST['o_amount']!="" and $_POST['o_type']!="")
	{
	          
      	date_default_timezone_set("Asia/Calcutta"); //India time (GMT+5:30)
		$date1 = date('d-m-Y H:i:s');
		$date2 = date('d-m-Y');
		$date3 = date('H:i:s');
		
 		 $qry1="INSERT INTO tbl_order
				  (user_id,
				  order_details,
				  a_id,
				  o_cdate,
				   o_date,
				   o_time,
				   o_amount,
				   o_type,
				   o_status
				) VALUES (
					'".$_POST['user_id']."',
					'".$_POST['order_details']."',
					'".$_POST['a_id']."',
					'".$date1."',
					'".$date2."',
					'".$date3."',
					'".$_POST['o_amount']."',
					'".$_POST['o_type']."',
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_order WHERE o_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);


  $someArray = json_decode($row['order_details'], true);
  //echo $someArray;

 $values_initials = array();
     
    for ($x = 0; $x <= count($someArray)-1 ; $x++) {
            
            
                 
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
            $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            
            
                  $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
	       
            	   $employees[] = array(
                                 'c_id'=> $someArray[$x]["category"],
                                'c_name'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                       'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                );
    }
    
  
     $employees1=json_encode($employees);

			$set['GROCERY_APP'][]	=	array( 
			    
			'msg' =>	" Successful",
			'success'=>'1',
			'o_id'	=>	$row['o_id'],
			'user_id' =>	$row['user_id'],
	        'order_details' => $employees1,
			'a_id'	=>	$row['a_id'],
			'o_cdate'	=>	$row['o_cdate'],
			'o_date'	=>	$row['o_date'],
			'o_time'	=>	$row['o_time'],
			'o_amount'	=>	$row['o_amount'],
			'o_type'	=>	$row['o_type'],
			'o_status'	=>	$row['o_status']

			);
				
	}else
	{
		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
	}
  			
			
	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
}


// else if(isset($_GET['edit_orders']))
// {
    


// 	if( $_POST['o_id']!="")
// 	{
// 	    	$qry = "SELECT * FROM tbl_order WHERE o_id = '".$_POST['o_id']."'"; 
// 		$result = mysqli_query($mysqli,$qry);
// 		$row = mysqli_fetch_assoc($result);
	          
//       	date_default_timezone_set("Asia/Calcutta"); //India time (GMT+5:30)
// 		$date = date('d-m-Y H:i:s');
// 			 // (user_id, order_details, a_id,o_cdate,o_date,o_time,o_amount//,o_type,d_name,d_phone,d_date_time,o_status
			 
			 
//  		  $qry1="UPDATE `tbl_order` SET 
// 		      `d_name`='".$_POST['d_name']."',
// 		      `d_phone`='".$_POST['d_phone']."',
// 		      `d_date_time`='".$_POST['d_date_time']."'
// 		    WHERE `o_id`='".$_POST['o_id']."'";
            
//             $result1=mysqli_query($mysqli,$qry1);  									 
		

// 			$qrys = "SELECT * FROM tbl_order WHERE o_id = '".$_POST['o_id']."'"; 
// 			$results = mysqli_query($mysqli,$qrys);
// 			$row = mysqli_fetch_assoc($results);

        
//           $someArray = json_decode($row['order_details'], true);
      
//          $values_initials = array();
             
//             for ($x = 0; $x <= count($someArray)-1 ; $x++) {
            
            
       
                 
//              	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
//             $result2 = mysqli_query($mysqli,$query2);
//             	$row3 = mysqli_fetch_assoc($result2);
//             	$row_name=$row3['p_name'];
//             	$p_dis_price=$row3['p_dis_price'];
//             	$p_unit=$row3['p_unit'];
//             	$p_image=$file_path.'images/'.$row3['p_image'];
//             	$p_qty=$row3['p_qty'];
            
            
//                   $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
//             $result3 = mysqli_query($mysqli,$query3);
//             	$row5 = mysqli_fetch_assoc($result3);
//             	$row6=$row5['c_name'];

            
            
//             	   $employees[] = array(
//                                  'cat_id'=> $someArray[$x]["category"],
//                                 'cat'=> $row6,
//                                   'product_id'=> $someArray[$x]["product"],
//                                 'product'=> $row_name,
//                                         'qunt'=> $someArray[$x]["qunt"],
//                                 'p_ori_price'=> $someArray[$x]["p_ori_price"],
//                                 'p_dis_price'=>$someArray[$x]["p_dis_price"],
//                                 'p_unit'=> $someArray[$x]["p_unit"],
//                                 'p_image'=> $p_image,
//                                 'p_qty'=> $someArray[$x]["p_qty"],
//                                 );
//             }
    

// 			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
				
// 	}else
// 	{
// 		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
// 	}
  			
			
	

		
// 		header( 'Content-Type: application/json; charset=utf-8' );
// 	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
// 		die();	
// }






 //add banner
 else if(isset($_GET['add_banner']))
 	{
 	    
 	   
 	if($_POST['b_name']!="" && $_FILES['b_image']['name']!="")
			{
			    
			      $banner_image=rand(0,99999)."_".$_FILES['b_image']['name'];
       
       //Main Image
     $tpath1='images/'.$banner_image;        
       $pic1=compress_image($_FILES["b_image"]["tmp_name"], $tpath1, 80);
   
    //Thumb Image 
     $thumbpath='images/thumbs/'.$banner_image;   
       $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 
					$qry1="INSERT INTO tbl_banner 
				  (b_name,
				  b_image,
				   b_status

				 
				) VALUES (
					'".$_POST['b_name']."',
					'".$banner_image."',
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_banner WHERE b_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);



			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'b_id'	=>	$row['b_id'],
			'b_name' =>	$row['b_name'],
			'b_image' =>$file_path.'images/'.$row['b_image'],
			'b_status'	=>	$row['b_status'],

			);
			}else
			{
				$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
			}
  			
	
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}
 
 
 
 //add banner
 else if(isset($_GET['add_pro_banners']))
 	{
 	    
 	   
 	if($_POST['b_name']!="" && $_FILES['b_image']['name']!="")
			{
			    
			      $banner_image=rand(0,99999)."_".$_FILES['b_image']['name'];
       
       //Main Image
     $tpath1='images/'.$banner_image;        
       $pic1=compress_image($_FILES["b_image"]["tmp_name"], $tpath1, 80);
   
    //Thumb Image 
     $thumbpath='images/thumbs/'.$banner_image;   
       $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 
					$qry1="INSERT INTO tbl_product_banner 
				  (c_id,
				  b_name,
				  b_image,
				   b_status

				 
				) VALUES (
				'".$_POST['c_id']."',
					'".$_POST['b_name']."',
					'".$banner_image."',
					1
				)"; 
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_product_banner WHERE b_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);



			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'b_id'	=>	$row['b_id'],
			'c_id'	=>	$row['c_id'],
			'b_name' =>	$row['b_name'],
			'b_image' =>$file_path.'images/'.$row['b_image'],
			'b_status'	=>	$row['b_status'],

			);
			}else
			{
				$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
			}
  			
	
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}
 
 
 
 //get all products Banner 
else if(isset($_GET['get_pro_banners']))
{

	
		$jsonObj1= array();
			
        
		 $query="SELECT * FROM `tbl_product_banner` 
		 LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product_banner.c_id 
		 WHERE tbl_product_banner.c_id='".$_POST['c_id']."'";
		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

          	$row['b_id'] = $data['b_id'];
          	
          	$row['c_id'] = $data['c_id'];
          	$row['c_name'] = $data['c_name'];
          		$row['b_name'] = $data['b_name'];
			$row['b_image'] = $file_path.'images/'.$data['b_image'];
			$row['b_image_thumb'] = $file_path.'images/thumbs/'.$data['b_image'];
			$row['b_status'] = $data['b_status'];
		
			array_push($jsonObj1,$row);

		
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//edit address
else if(isset($_GET['Update_pro_banners']))
{
		
		$sql = "SELECT * FROM tbl_product_banner where b_id = '".$_POST['b_id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);

		
	if($_FILES['b_image']['name'] != "")
		{	
			if($row['b_image'] !== "") 
			{
			 	unlink('images/'.$row['b_image']); 
			 	unlink('images/thumbs/'.$row['b_image']); 
			}

			$facility_image=rand(0,99999)."_".$_FILES['b_image']['name'];
		   //Main Image
		   	$tpath1='images/'.$facility_image; 		
			$pic1=compress_image($_FILES["b_image"]["tmp_name"], $tpath1, 80);
		 	$thumbpath='images/thumbs/'.$facility_image;		
	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 		}
 		else
 		{
 			(($row['b_image'] !== "") ? $facility_image = $row['b_image'] : $facility_image = "");
 		}

		
 if($_POST['b_name']!="")
		{
			$user_edit="UPDATE `tbl_product_banner` SET
			 `c_id`='".$_POST['c_id']."',
		    `b_name`='".$_POST['b_name']."',
		    `b_image`='".$facility_image."'
		    
		    WHERE `b_id`='".$_POST['b_id']."'";	 
		
		}else{
		$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}
	
   		
   			$user_res = mysqli_query($mysqli,$user_edit);	
	  	
			$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}
//delete address
else if(isset($_GET['Delete_pro_banner']))
 	{

		$jsonObj= array();
 		$b_id=$_POST['b_id'];

		if($_POST['b_id'] != "") 
		{

		$qry = "SELECT * FROM tbl_product_banner WHERE b_id='".$b_id."'"; 
			
		$result 	= mysqli_query($mysqli,$qry);
		$num_rows 	= mysqli_num_rows($result);
			//$row = mysqli_fetch_array($result);
			
			if($num_rows > 0)
			{
			
				$delete = "DELETE FROM tbl_product_banner where b_id = '".$b_id."'";
				$result1 = mysqli_query($mysqli,$delete);

				if($result1 == 1)
					$set['GROCERY_APP'][]=array('msg' => "Banner deleted successfully...!",'success'=>'1');
				else
					$set['GROCERY_APP'][]=array('msg' => "Some error occured",'success'=>'0');
				

			}
			else
			{	
				$set['GROCERY_APP'][]=array('msg' => "Data Not  found ",'success'=>'0');
			} 
 	
	}
	else
		{
			$set['GROCERY_APP'][]=array('msg' => "Please enter banner id",'success'=>'0');
		}	 
			header( 'Content-Type: application/json; charset=utf-8' );
 	   		echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
 			die();
		
		}
		
		
//login manager
else if(isset($_GET['login_manager']))
 	{

		$m_email = $_POST['m_email'];
		$m_pass = $_POST['m_pass'];
			$m_token 	= $_POST['m_token'];

	  $qry = "SELECT * FROM tbl_manager
	  WHERE m_email = '".$m_email."' and m_pass = '".$m_pass."' and m_status = 1 "; 
		
		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row = mysqli_fetch_assoc($result);
		
    	if ($num_rows > 0)
		{ 
		    
		  $user_edit= "UPDATE tbl_manager SET m_token='".$m_token."' WHERE m_email = '".$m_email."' and m_pass = '".$m_pass."' "; 
    		           
        	$user_res = mysqli_query($mysqli,$user_edit);
		    
		    
			$set['GROCERY_APP'][]	= array(  
							'msg' => "successfully"  ,
                			'success'=>'1',
                			'm_id'	=>	$row['m_id'],
                  			'm_name' =>	$row['m_name'],
                			'm_email'	=>	$row['m_email'],
                			'm_pass'	=>	$row['m_pass'],
                            'm_status'	=>	$row['m_status'],
	     								);
		  
			header( 'Content-Type: application/json; charset=utf-8' );
    	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    		die();
		}		 
		else
		{
			$set['GROCERY_APP'][]=array('msg' =>'Invalid username and password','success'=>'0');
 	
			header( 'Content-Type: application/json; charset=utf-8' );
    	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    		die();
		}	
 	}
 	
 	
 	//login manager
else if(isset($_GET['get_manager']))
 	{

		$m_id = $_POST['m_id'];
	
    	  $qry = "SELECT * FROM tbl_manager
    	  WHERE m_id = '".$m_id."' "; 
		
		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row = mysqli_fetch_assoc($result);
		
    	if ($num_rows > 0)
		{ 
		    
		    
			$set['GROCERY_APP'][]	= array(  
							'msg' => "successfully"  ,
                			'success'=>'1',
                			'm_id'	=>	$row['m_id'],
                  			'm_name' =>	$row['m_name'],
                			'm_email'	=>	$row['m_email'],
                			'm_pass'	=>	$row['m_pass'],
                				'm_phone'	=>	$row['m_phone'],
                				'm_image'	=>	$row['m_image'],
                					'm_address'	=>	$row['m_address'],
                            'm_status'	=>	$row['m_status'],
	     								);
		  
			header( 'Content-Type: application/json; charset=utf-8' );
    	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    		die();
		}		 
		else
		{
			$set['GROCERY_APP'][]=array('msg' =>'Invalid username and password','success'=>'0');
 	
			header( 'Content-Type: application/json; charset=utf-8' );
    	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    		die();
		}	
 	}
 	
//users update profile
else if(isset($_GET['manager_Update']))
{

		$sql = "SELECT * FROM tbl_manager where m_id = '".$_POST['m_id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);
		
		if($_FILES['m_image']['name'] != "")
		{	
			if($row['m_image'] !== "") 
			{
			 	unlink('images/'.$row['m_image']); 
			 	unlink('images/thumbs/'.$row['m_image']); 
			}

			$facility_image=rand(0,99999)."_".$_FILES['m_image']['name'];
		   //Main Image
		   	$tpath1='images/'.$facility_image; 		
			$pic1=compress_image($_FILES["m_image"]["tmp_name"], $tpath1, 80);
		 	$thumbpath='images/thumbs/'.$facility_image;		
	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 		}
 		else
 		{
 			$facility_image = $row['m_image'];
 		}

	
			$user_edit= "UPDATE tbl_manager SET 
			m_name='".$_POST['m_name']."',
				m_address='".$_POST['m_address']."',
			 m_phone='".$_POST['m_phone']."',
			m_image = '".$facility_image."'
			WHERE m_id = '".$_POST['m_id']."'";	 
	
   		$user_res = mysqli_query($mysqli,$user_edit);	
	  	
		$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

 	
//popular product 	

else if(isset($_GET['popular_product']))
 	{

	    $jsonObj= array();	

		
		$tableName="tbl_product";		
		$limit = 10; 
		
		$query = "SELECT COUNT(*) as num FROM $tableName where tbl_product.p_status=1 ORDER BY tbl_product.p_id DESC";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
		$total_pages = $total_pages['num'];
		
		$stages = 3;
		$page=0;
		if(isset($_GET['page'])){
		$page = mysqli_real_escape_string($mysqli,$_GET['page']);
		}
		if($page){
			$start = ($page - 1) * $limit; 
		}else{
			$start = 0;	
			}

 $query="SELECT * FROM `tbl_product`
LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id 
		where tbl_product.p_status = 1 ORDER BY tbl_product.p_id DESC LIMIT $start, $limit";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

			$someArray = json_decode($data['p_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {

            
            	//[{"no":"1","qty":"1","unit":"kg","dis_price":"100","ori_price":"200"},
            $employees[$x]= array(
                                 'no'=> $someArray[$x]["no"],
                                   'qty'=> $someArray[$x]["qty"],
                                'unit'=> $someArray[$x]["unit"],
                                'dis_price'=> $someArray[$x]["dis_price"],
                                    'ori_price'=> $someArray[$x]["ori_price"]
                                );
        }

			$row['p_id']=$data['p_id'];
			$row['c_id']=$data['c_id'];
			$row['c_name']=$data['c_name'];
	
			$row['p_name'] = $data['p_name'];
 			$row['p_desc'] = $data['p_desc'];
			$row['p_hsncode'] = $data['p_hsncode'];
 			$row['p_gstper'] = $data['p_gstper'];
 			$row['Productdetails'] = $employees;
 			$row['p_image'] = $file_path.'images/'.$data['p_image'];
 				$row['p_stock'] = $data['p_stock'];
 			$row['p_status'] = $data['p_status'];
			

			array_push($jsonObj,$row);
		
		}

       
        $set['page'] = $_GET['page'];
        $set['totalimage'] = $total_pages;
        $set['limit'] = '10';
        $set['success'] = '1';
		$set['GROCERY_APP'] = $jsonObj;	

 	
			header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}
	
	//Top Discount product 	

else if(isset($_GET['top_discount']))
 	{

	    $jsonObj= array();	

		
		$tableName="tbl_product";		
		$limit = 10; 
		
		$query = "SELECT COUNT(*) as num FROM $tableName where tbl_product.p_stock=1 ORDER BY tbl_product.p_id DESC";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
		$total_pages = $total_pages['num'];
		
		$stages = 3;
		$page=0;
		if(isset($_GET['page'])){
		$page = mysqli_real_escape_string($mysqli,$_GET['page']);
		}
		if($page){
			$start = ($page - 1) * $limit; 
		}else{
			$start = 0;	
			}

 $query="SELECT * FROM `tbl_product`
LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id 
where tbl_product.p_stock=1
ORDER BY tbl_product.p_id DESC LIMIT $start, $limit";


		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
				$someArray = json_decode($data['p_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {

            
            	//[{"no":"1","qty":"1","unit":"kg","dis_price":"100","ori_price":"200"},
            $employees[$x]= array(
                                 'no'=> $someArray[$x]["no"],
                                   'qty'=> $someArray[$x]["qty"],
                                'unit'=> $someArray[$x]["unit"],
                                'dis_price'=> $someArray[$x]["dis_price"],
                                    'ori_price'=> $someArray[$x]["ori_price"]
                                );
        }


			$row['p_id']=$data['p_id'];
			$row['c_id']=$data['c_id'];
			$row['c_name']=$data['c_name'];
	
			$row['p_name'] = $data['p_name'];
 			$row['p_desc'] = $data['p_desc'];
 			$row['Productdetails'] = $employees;
 			$row['p_image'] = $file_path.'images/'.$data['p_image'];
 				$row['p_stock'] = $data['p_stock'];
 			$row['p_status'] = $data['p_status'];

			array_push($jsonObj,$row);
		
		}

       
        $set['page'] = $_GET['page'];
        $set['totalvideo'] = $total_pages;
        $set['limit'] = '10';
        $set['success'] = '1';
		$set['GROCERY_APP'] = $jsonObj;	

 	
			header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}
	
// whats_new_product 	

else if(isset($_GET['whats_new_product']))
 	{

	    $jsonObj= array();	

		
		$tableName="tbl_product";		
		$limit = 10; 
		
		$query = "SELECT COUNT(*) as num FROM $tableName ORDER BY tbl_product.p_id DESC";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
		$total_pages = $total_pages['num'];
		
		$stages = 3;
		$page=0;
		if(isset($_GET['page'])){
		$page = mysqli_real_escape_string($mysqli,$_GET['page']);
		}
		if($page){
			$start = ($page - 1) * $limit; 
		}else{
			$start = 0;	
			}

 $query="SELECT * FROM `tbl_product`
LEFT JOIN tbl_category ON tbl_category.c_id=tbl_product.c_id 
ORDER BY tbl_product.p_id DESC LIMIT $start, $limit";


		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{

$someArray = json_decode($data['p_details'], true);
           

            for ($x = 0; $x <= count($someArray) -1 ; $x++) {

            
            	//[{"no":"1","qty":"1","unit":"kg","dis_price":"100","ori_price":"200"},
            $employees[$x]= array(
                                 'no'=> $someArray[$x]["no"],
                                   'qty'=> $someArray[$x]["qty"],
                                'unit'=> $someArray[$x]["unit"],
                                'dis_price'=> $someArray[$x]["dis_price"],
                                    'ori_price'=> $someArray[$x]["ori_price"]
                                );
        }


			$row['p_id']=$data['p_id'];
			$row['c_id']=$data['c_id'];
			$row['c_name']=$data['c_name'];
	
			$row['p_name'] = $data['p_name'];
 			$row['p_desc'] = $data['p_desc'];
 			$row['Productdetails'] = $employees;
 			$row['p_image'] = $file_path.'images/'.$data['p_image'];
 				$row['p_stock'] = $data['p_stock'];
 			$row['p_status'] = $data['p_status'];

			array_push($jsonObj,$row);
		
		}

       
        $set['page'] = $_GET['page'];
        $set['totalvideo'] = $total_pages;
        $set['limit'] = '10';
        $set['success'] = '1';
		$set['GROCERY_APP'] = $jsonObj;	

 	
			header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}
	
	
		
// deliveryboy dashboad

else if(isset($_GET['dashboad']))
 	{

	    $jsonObj= array();	

	date_default_timezone_set("Asia/Calcutta"); //India time (GMT+5:30)
		$date = date('d-m-Y H:i:s');
		$date1 = date('d-m-Y');
		$date2 = date('H:i:s');

		$query1 = "SELECT COUNT(*) as num FROM tbl_order";
		$total_pages1 = mysqli_fetch_array(mysqli_query($mysqli,$query1));
		$total_order = $total_pages1['num'];

    	 $query2 = "SELECT COUNT(*) as num FROM tbl_order where o_date = '".$date1."'";
		$total_pages2 = mysqli_fetch_array(mysqli_query($mysqli,$query2));
		$today_order = $total_pages2['num'];

     	$query3 = "SELECT COUNT(*) as num FROM tbl_order where o_type = 1 and o_date = '".$date1."' ";
		$total_pages3 = mysqli_fetch_array(mysqli_query($mysqli,$query3));
		$total_todaypending_order = $total_pages3['num'];     
		
		$query6 = "SELECT COUNT(*) as num FROM tbl_order where o_type = 4 and o_date = '".$date1."' ";
		$total_pages6 = mysqli_fetch_array(mysqli_query($mysqli,$query6));
		$total_todaycancle_order = $total_pages6['num'];     
		
		$query4 = "SELECT SUM(o_amount) as o_amount FROM tbl_order where o_type = 1 or o_type = 2 or o_type = 5 ";
		$total_pages4 = mysqli_fetch_array(mysqli_query($mysqli,$query4));
		$total_amount_order = $total_pages4['o_amount'];

     	$query5 = "SELECT SUM(o_amount) as o_amount FROM tbl_order where o_type = 1 or o_type = 2 or o_type = 5 and o_date = '".$date1."' ";
		$total_pages5 = mysqli_fetch_array(mysqli_query($mysqli,$query5));
		$total_todayamount_order = $total_pages5['o_amount'];     
      
        $set['total_order'] = $total_order;
        $set['today_order'] = $today_order;
        $set['total_todaypending_order'] = $total_todaypending_order;
        $set['total_todaycancle_order'] = $total_todaycancle_order;
		$set['total_amount_order'] = $total_amount_order;	
		$set['total_todayamount_order'] = $total_todayamount_order;	

 	
			header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}


	else if(isset($_GET['get_delivery_boy']))
 	{

	    $jsonObj= array();	
	
 $query="SELECT * FROM `tbl_delivery_boy`
where b_activestatus = 1 and b_status = 1
ORDER BY tbl_delivery_boy.b_id DESC";


		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{


			$row['b_id']=$data['b_id'];
			$row['b_name']=$data['b_name'];
			$row['b_email']=$data['b_email'];
	
			$row['b_pass'] = $data['b_pass'];
 			$row['b_phone'] = $data['b_phone'];
 			$row['b_image'] = $file_path.'images/'.$data['b_image'];
 				$row['b_address'] = $data['b_address'];
 					$row['b_activestatus'] = $data['b_activestatus'];
 			$row['b_status'] = $data['b_status'];

			array_push($jsonObj,$row);
		
		}

       
      
		$set['GROCERY_APP'] = $jsonObj;	

 	
			header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}



	
//Login with ussername and password
else if(isset($_GET['boy_login']))
{
	if($_POST['b_email']!=="" and $_POST['b_pass']!=="")
	{

		$email_id = $_POST['b_email'];
		$password = $_POST['b_pass'];
			$b_token = $_POST['b_token'];

	  $qry = "SELECT * FROM tbl_delivery_boy WHERE b_email = '".$email_id."' and b_pass = '".$password."'"; 
		
		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row = mysqli_fetch_assoc($result);
		
    	if ($num_rows > 0)
		{ 
		      $user_edit= "UPDATE tbl_delivery_boy SET b_token='".$b_token."' WHERE b_email = '".$email_id."' and b_pass = '".$password."'"; 
    		           
		     	$result1 = mysqli_query($mysqli,$user_edit);
		
			$set['GROCERY_APP'][]	= array(  
										  'msg'			=>	'Successflly Logged in',
										  'success'=>'1',
										'b_id'	=>	$row['b_id'],
										'b_name' =>	$row['b_name'],
										'b_email'	=>	$row['b_email'],
										'b_image'	=> $file_path.'images/'.$row['b_image'],
										'b_pass'	=>	$row['b_pass'],
										'b_phone'	=>	$row['b_phone'],
										'b_address'	=>	$row['b_address'],
										'b_status'	=>	$row['b_status'],
								
	     								);
		  
		}		 
		else
		{
			$set['GROCERY_APP'][]=array('msg' =>'Invalid username and password','success'=>'0');
 	
		}
	}
		header( 'Content-Type: application/json; charset=utf-8' );
    	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    		die();
}

//users update profile
else if(isset($_GET['boy_Update']))
{

		$sql = "SELECT * FROM tbl_delivery_boy where b_id = '".$_POST['b_id']."' ";
		$res = mysqli_query($mysqli,$sql);
		$row = mysqli_fetch_assoc($res);
		
		if($_FILES['b_image']['name'] != "")
		{	
			if($row['b_image'] !== "") 
			{
			 	unlink('images/'.$row['b_image']); 
			 	unlink('images/thumbs/'.$row['b_image']); 
			}

			$facility_image=rand(0,99999)."_".$_FILES['b_image']['name'];
		   //Main Image
		   	$tpath1='images/'.$facility_image; 		
			$pic1=compress_image($_FILES["b_image"]["tmp_name"], $tpath1, 80);
		 	$thumbpath='images/thumbs/'.$facility_image;		
	       	$thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 		}
 		else
 		{
 			$facility_image = $row['b_image'];
 		}

	
			$user_edit= "UPDATE tbl_delivery_boy SET 
			b_name='".$_POST['b_name']."',
			 b_phone='".$_POST['b_phone']."',
			 	 b_address='".$_POST['b_address']."',
			b_image = '".$facility_image."'
			WHERE b_id = '".$_POST['b_id']."'";	 
		
	
   		$user_res = mysqli_query($mysqli,$user_edit);	
	  	
		$set['GROCERY_APP'][]=array('msg'=>'Updated','success'=>'1');
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}


//users update profile
else if(isset($_GET['boy_static_Update']))
{
	
		$user_edit= "UPDATE tbl_delivery_boy SET 
		b_activestatus='".$_POST['b_activestatus']."'
		WHERE b_id = '".$_POST['b_id']."'";	 
		
   		$user_res = mysqli_query($mysqli,$user_edit);	
	  	
		$set['GROCERY_APP'][]=array('msg'=>'Status changed','success'=>'1');
		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//get users profile with users id
else if(isset($_GET['getdeliveryProfile']))
{

			  //INSERT INTO `tbl_delivery_boy`(`b_id`, `b_name`, `b_email`, `b_pass`, `b_phone`, `b_address`, `b_image`, `b_status`)

		$qry = "SELECT * FROM tbl_delivery_boy WHERE b_id = '".$_POST['b_id']."'"; 
		$result = mysqli_query($mysqli,$qry);
		 
		$row = mysqli_fetch_assoc($result);
	  				 
	    $set['GROCERY_APP'][]	=	array(
						'b_id'	=>	$row['b_id'],
						'b_name' =>	$row['b_name'],
						'b_email'	=>	$row['b_email'],
						'b_image'	=> $file_path.'images/'.$row['b_image'],
						'b_pass'	=>	$row['b_pass'],
						'b_phone'	=>	$row['b_phone'],
						'b_address'	=>	$row['b_address'],
							'b_activestatus'	=>	$row['b_activestatus'],
						'b_status'	=>	$row['b_status'],
	    	
	    							);

	   	header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//add boy
else if(isset($_GET['add_boy']))
{


   $qry = "SELECT * FROM `tbl_order`
WHERE tbl_order.user_id='".$_POST['user_id']."' AND tbl_order.o_id='".$_POST['o_id']."' ";

		$result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
		$row1 = mysqli_fetch_assoc($result);
		
         if ($num_rows > 0)
		{
		    
    		      $user_edit= "UPDATE tbl_order SET b_id='".$_POST['b_id']."' WHERE tbl_order.user_id='".$_POST['user_id']."' AND tbl_order.o_id='".$_POST['o_id']."' ";	 
    		    
                $result = mysqli_query($mysqli,$user_edit);

    	 
			$set['GROCERY_APP'][]=array('msg'=>'Successfully Updated','success'=>'1');
		}
		else
		{
				$set['GROCERY_APP'][]=array('msg'=>'Updated Fail','success'=>'0');	 
				
		}
			
		 	header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}


//get all order with boy wise
else if(isset($_GET['get_order_boy']))
{

		$jsonObj1= array();
	
		 $query="SELECT  *  FROM `tbl_order`
    left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
    left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
    left join tbl_delivery_boy on tbl_delivery_boy.b_id = tbl_order.b_id
            left join tbl_coupon on tbl_coupon.cpn_id = tbl_order.cpn_id

    WHERE tbl_order.b_id='".$_POST['b_id']."' ORDER BY tbl_order.o_id DESC";

		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{

        	$someArray = json_decode($data['order_details'], true);
        

            for ($x = 0; $x <= count($someArray) - 1 ; $x++) {
                

    
            
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	   $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            	
           $employees[$x] = array('category_id'=> $someArray[$x]["category"],
                                'category'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                      'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                    
                                );
    
            }
         

			
			
					
					
           		$row['o_id'] = $data['o_id'];
    			
    			$row['user_id'] = $data['user_id'];
    			$row['f_name'] = $data['f_name'];
    			$row['l_name'] = $data['l_name'];
    			$row['mobile'] = $data['mobile'];
    		
    		
    			$row['b_id'] = $data['b_id'];
    			$row['b_name'] = $data['b_name'];
    			$row['b_email'] = $data['b_email'];
    			$row['b_pass'] = $data['b_pass'];
    			$row['b_phone'] = $data['b_phone'];
    			$row['b_address'] = $data['b_address'];
		    	$row['b_image'] =$file_path.'images/'. $data['b_image'];
    		
    		
    		
    		
    				$row['order_details'] = $employees;
    			$row['a_id'] = $data['a_id'];
    			$row['a_name'] = $data['a_name'];
    			$row['a_number'] = $data['a_number'];
    			$row['a_houser_no'] = $data['a_houser_no'];
    			$row['a_lendmark'] = $data['a_lendmark'];
    			$row['a_adderss'] = $data['a_adderss'];
    			$row['o_cdate'] = $data['o_cdate'];
    			$row['o_date'] = $data['o_date'];
    			$row['o_time'] = $data['o_time'];
    			$row['o_amount'] = $data['o_amount'];
    			$row['o_type'] = $data['o_type'];
    				if($data['cpn_id'] == 0 )
			{
			    $row['cpn_id']=0;
			    $row['cpn_name']='';
			    $row['cpn_price']=0;
			}else
			{
			  	$row['cpn_id'] = $data['cpn_id'];
			                $row['cpn_name'] = $data['cpn_name'];
		                	$row['cpn_price'] = $data['cpn_price'];
		                
			}
        		$row['o_txtfinalamount'] = $data['o_txtfinalamount'];		 
    			$row['payment_type'] = $data['payment_type'];
			$row['payment_orderid'] = $data['payment_orderid'];
    			$row['o_status'] = $data['o_status']; 
            
		  		  array_push($jsonObj1,$row);

		
		}
		
	
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

//get all order with boy today wise
else if(isset($_GET['get_order_today_boy']))
{

		$jsonObj1= array();
		
			date_default_timezone_set("Asia/Calcutta"); //India time (GMT+5:30)
		$date = date('d-m-Y H:i:s');
		$date1 = date('d-m-Y');

		 $query="SELECT  *  FROM `tbl_order`
    left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
    left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
    left join tbl_delivery_boy on tbl_delivery_boy.b_id = tbl_order.b_id
            left join tbl_coupon on tbl_coupon.cpn_id = tbl_order.cpn_id
    WHERE tbl_order.b_id='".$_POST['b_id']."' and tbl_order.o_date='".$date1."'  ORDER BY tbl_order.o_id DESC";

		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{

        	$someArray = json_decode($data['order_details'], true);
        

            for ($x = 0; $x <= count($someArray) - 1 ; $x++) {
                

    
            
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	   $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            	
           $employees[$x] = array('category_id'=> $someArray[$x]["category"],
                                'category'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                      'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                    
                                );
    
            }
         

			
			
					
					
           		$row['o_id'] = $data['o_id'];
    			
    			$row['user_id'] = $data['user_id'];
    			$row['f_name'] = $data['f_name'];
    			$row['l_name'] = $data['l_name'];
    			$row['mobile'] = $data['mobile'];
    		
    		
    			$row['b_id'] = $data['b_id'];
    			$row['b_name'] = $data['b_name'];
    			$row['b_email'] = $data['b_email'];
    			$row['b_pass'] = $data['b_pass'];
    			$row['b_phone'] = $data['b_phone'];
    			$row['b_address'] = $data['b_address'];
		    	$row['b_image'] =$file_path.'images/'. $data['b_image'];
    		
    		
    		
    		
    				$row['order_details'] = $employees;
    			$row['a_id'] = $data['a_id'];
    			$row['a_name'] = $data['a_name'];
    			$row['a_number'] = $data['a_number'];
    			$row['a_houser_no'] = $data['a_houser_no'];
    			$row['a_lendmark'] = $data['a_lendmark'];
    			$row['a_adderss'] = $data['a_adderss'];
    			$row['o_cdate'] = $data['o_cdate'];
    			$row['o_date'] = $data['o_date'];
    			$row['o_time'] = $data['o_time'];
    			$row['o_amount'] = $data['o_amount'];
    			$row['o_type'] = $data['o_type'];
    				if($data['cpn_id'] == 0 )
			{
			    $row['cpn_id']=0;
			    $row['cpn_name']='';
			    $row['cpn_price']=0;
			}else
			{
			  	$row['cpn_id'] = $data['cpn_id'];
			                $row['cpn_name'] = $data['cpn_name'];
		                	$row['cpn_price'] = $data['cpn_price'];
		                
			}
        		$row['o_txtfinalamount'] = $data['o_txtfinalamount'];		 
    			$row['payment_type'] = $data['payment_type'];
			$row['payment_orderid'] = $data['payment_orderid'];
    			$row['o_status'] = $data['o_status']; 
            
		  		  array_push($jsonObj1,$row);

		
		}
		
	
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

else if(isset($_GET['get_coupon']))
{

		$jsonObj1= array();
	  //tbl_coupon  cpn_id	cpn_name	cpn_promocode	cpn_start_date	cpn_end_date	cpn_status

		$query="SELECT * FROM `tbl_coupon`
		WHERE cpn_status = 1
       ORDER BY tbl_coupon.cpn_id ASC";

		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
           $join1= $data['cpn_start_date'];
            $end1= $data['cpn_end_date'];
            
            $paymentDate1 = new DateTime(); // Today
            $paymentDate1->format('d-m-Y'); // echos today! 
            $contractDateBegin1 = new DateTime($join1);
            $contractDateEnd1 = new DateTime($end1);
        
if (
                        $paymentDate1->getTimestamp() > $contractDateBegin1->getTimestamp() && 
                        $paymentDate1->getTimestamp() < $contractDateEnd1->getTimestamp()
                    )
                    {
                        $row['account']  = 1 ;
                    
                    }else
                    {
                        $row['account'] = 0 ;
                    	
                    }
        //	INSERT INTO `tbl_coupon`(`cpn_id`, `cpn_name`, `cpn_promocode`, `cpn_mincart`, `cpn_type`, `cpn_price`, `cpn_start_date`, `cpn_end_date`, `cpn_status`) 

			$row['coupon_id'] = $data['cpn_id'];
			$row['coupon_name'] =$data['cpn_name'];
			$row['coupon_promocode'] =$data['cpn_promocode'];
			$row['coupon_mincart'] =$data['cpn_mincart'];
			$row['coupon_type'] =$data['cpn_type'];
			$row['cpn_price'] =$data['cpn_price'];
			$row['coupon_start_date'] = $data['cpn_start_date'];
			$row['coupon_end_date'] = $data['cpn_end_date'];
			$row['coupon_status'] = $data['cpn_status'];
	
	
			array_push($jsonObj1,$row);
        
		    
		}
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}

else if(isset($_GET['get_data']))
 	{
  		 $jsonObj4= array();	
       // INSERT INTO `tbl_ordervalue`(`v_id`, `v_min_value`, `v_max_value`, `v_status`)
		$query="SELECT * FROM tbl_ordervalue WHERE v_id='1'";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());


		while($data = mysqli_fetch_assoc($sql))
		{
			 
			$row['v_id'] = $data['v_id'];
			$row['v_min_value'] = $data['v_min_value'];
			$row['v_max_value'] = $data['v_max_value'];
			$row['v_status'] = $data['v_status'];
		
		
	
			array_push($jsonObj4,$row); 
			}
		
		$set['GROCERY_APP'] = $jsonObj4;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 }
 
else if(isset($_GET['get_video']))
 	{
 	     $jsonObj4= array();	
       // INSERT INTO `tbl_ordervalue`(`v_id`, `v_min_value`, `v_max_value`, `v_status`)
		$query="SELECT * FROM tbl_video order by tbl_video.v_id desc";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());


		while($data = mysqli_fetch_assoc($sql))
		{
			 
			$row['v_id'] = $data['v_id'];
			$row['v_name'] = $data['v_name'];
			$row['v_urls'] = $data['v_urls'];
			$row['v_status'] = $data['v_status'];
		
		
	
			array_push($jsonObj4,$row); 
			}
		
		$set['GROCERY_APP'] = $jsonObj4;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 	}
 	
 	//add Adderss Details
else if(isset($_GET['add_custom_order']))
{
	
  if($_POST['u_id']!="")
  {
$banner_image=rand(0,99999)."_".$_FILES['co_image']['name'];
       
       //Main Image
     $tpath1='images/'.$banner_image;        
       $pic1=compress_image($_FILES["co_image"]["tmp_name"], $tpath1, 80);
   
    //Thumb Image 
     $thumbpath='images/thumbs/'.$banner_image;   
       $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'200','200');   
 	
	//	INSERT INTO `tbl_custom_order`(`co_id`, `u_id`, `co_image`, co_comment,`co_status`)
  			 $qry1="INSERT INTO tbl_custom_order
				  (u_id,
				  a_id,
				  co_image,
				  co_comment,
				   co_status

				) VALUES (
					'".$_POST['u_id']."',
					'".$_POST['a_id']."',
					'".$banner_image."',
					'".$_POST['co_comment']."',
					1
				)"; 
  
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_custom_order WHERE co_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);



			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'co_id'	=>	$row['co_id'],
			'u_id' =>	$row['u_id'],
			'a_id' =>	$row['a_id'],
			'co_image'	=>	$file_path.'images/'.$row['co_image'],
			'co_comment' =>	$row['co_comment'],
			'co_status'	=>	$row['co_status'],
		
			);
				
		}
		else{
			$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}	
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
}


	//add Adderss Details
else if(isset($_GET['add_comment']))
{
	
  if($_POST['u_id']!="")
  {

 	

                $qry1="INSERT INTO tbl_comment
				  (u_id,
				  co_id,
				   cm_msg,
                    cm_status
				) VALUES (
					'".$_POST['u_id']."',
					'".$_POST['co_id']."',
					'".$_POST['cm_msg']."',
					1
				)"; 
  
            
            $result1=mysqli_query($mysqli,$qry1);  									 
		
			 $last_id = mysqli_insert_id($mysqli); 
 

			$qrys = "SELECT * FROM tbl_comment WHERE cm_id = '".$last_id."'"; 
			$results = mysqli_query($mysqli,$qrys);
			$row = mysqli_fetch_assoc($results);

//INSERT INTO `tbl_comment`(`cm_id`, `u_id`, `co_id`, `cm_msg`, `cm_status`)  


			$set['GROCERY_APP'][]	=	array( 
			'msg' =>	" Successful",
			'success'=>'1',
			'cm_id'	=>	$row['cm_id'],
			'u_id' =>	$row['u_id'],
			'co_id'	=>	$row['co_id'],
			'cm_msg'	=>	$row['cm_msg'],
			'cm_status'	=>	$row['cm_status'],
			);
				
		}
		else{
			$set['GROCERY_APP'][]=array('msg' => "some thing went wrong ...!",'success'=>'0');
		}	
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
}


else if(isset($_GET['get_comment']))
 	{
 	     $jsonObj4= array();	
//INSERT INTO `tbl_comment`(`cm_id`, `u_id`, `co_id`, `cm_msg`, `cm_status`)  
		$query="SELECT * FROM tbl_comment 
		left join tbl_registration on tbl_registration.id=tbl_comment.u_id
		left join tbl_custom_order on tbl_custom_order.co_id=tbl_comment.co_id
		where tbl_comment.co_id='".$_POST['co_id']."'
		order by tbl_comment.cm_id desc";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());


		while($data = mysqli_fetch_assoc($sql))
		{
			 
			$row['cm_id'] = $data['cm_id'];
			$row['u_id'] = $data['u_id'];
			$row['f_name'] = $data['f_name'];
				$row['l_name'] = $data['l_name'];
			$row['co_id'] = $data['co_id'];
			$row['co_image'] = $file_path.'images/'.$data['co_image'];
			$row['cm_msg'] = $data['cm_msg'];
		$row['cm_status'] = $data['cm_status'];
		
	
			array_push($jsonObj4,$row); 
			}
		
		$set['GROCERY_APP'] = $jsonObj4;	

		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 	}


//get all order
else if(isset($_GET['get_orders_order_id']))
{
    
		$jsonObj1= array();
	
		 $query="SELECT  tbl_coupon.cpn_name , tbl_order.* , tbl_registration.* , tbl_adderss.*  , tbl_delivery_boy.*  FROM `tbl_order`
    left JOIN tbl_registration ON tbl_registration.id=tbl_order.user_id
    left join tbl_adderss on tbl_adderss.a_id = tbl_order.a_id
        left join tbl_coupon on tbl_coupon.cpn_id = tbl_order.cpn_id
   left join tbl_delivery_boy on tbl_delivery_boy.b_id = tbl_order.b_id
    WHERE tbl_order.o_id='".$_GET['o_id']."' ORDER BY tbl_order.o_id DESC";

		 $sql = mysqli_query($mysqli,$query)or die(mysqli_error());
        		 
		while($data = mysqli_fetch_assoc($sql))
		{

        	$someArray = json_decode($data['order_details'], true);
        

            for ($x = 0; $x <= count($someArray) - 1 ; $x++) {

    
            
             	$query2="SELECT * FROM tbl_product WHERE p_id='".$someArray[$x]["product"]."' ";
                $result2 = mysqli_query($mysqli,$query2);
            	$row3 = mysqli_fetch_assoc($result2);
            	$row_name=$row3['p_name'];
            	$p_dis_price=$row3['p_dis_price'];
            	$p_unit=$row3['p_unit'];
            	$p_image=$file_path.'images/'.$row3['p_image'];
            	$p_qty=$row3['p_qty'];
            	
            	   $query3="SELECT * FROM tbl_category WHERE c_id='".$someArray[$x]["category"]."' ";
            $result3 = mysqli_query($mysqli,$query3);
            	$row5 = mysqli_fetch_assoc($result3);
            	$row6=$row5['c_name'];
            	
            $employees[$x] = array('category_id'=> $someArray[$x]["category"],
                                'category'=> $row6,
                                   'product_id'=> $someArray[$x]["product"],
                                'product'=> $row_name,
                                      'qunt'=> $someArray[$x]["qunt"],
                                'p_ori_price'=> $someArray[$x]["p_ori_price"],
                                'p_dis_price'=>$someArray[$x]["p_dis_price"],
                                'p_unit'=> $someArray[$x]["p_unit"],
                                'p_image'=> $p_image,
                                'p_qty'=> $someArray[$x]["p_qty"],
                                    
                                );
    
            }
         

			$row['o_id'] = $data['o_id'];
			$row['user_id'] = $data['user_id'];
			$row['f_name'] = $data['f_name'];
			$row['order_details'] = $employees;
			$row['a_id'] = $data['a_id'];
			$row['a_name'] = $data['a_name'];
			$row['a_number'] = $data['a_number'];
			$row['a_houser_no'] = $data['a_houser_no'];
			$row['a_lendmark'] = $data['a_lendmark'];
			$row['a_adderss'] = $data['a_adderss'];
			$row['o_cdate'] = $data['o_cdate'];
			$row['o_date'] = $data['o_date'];
			$row['o_time'] = $data['o_time'];
			$row['o_amount'] = $data['o_amount'];
			$row['o_type'] = $data['o_type'];
			
			if($data['b_id'] == null && $data['b_name'] ==null && $data['b_phone']==null)
			{
			    $row['d_date_time']=0;
			    $row['d_name']='';
			    $row['d_phone']='';
			}else
			{
			    $row['d_date_time'] = $data['b_id'];
			         $row['d_name'] = $data['b_name'];
		                      $row['d_phone'] = $data['b_phone'];
			}
		                  
	if($data['cpn_id'] == 0 )
			{
			    $row['cpn_id']=0;
			    $row['cpn_name']='';			   
			}else
			{
			  	$row['cpn_id'] = $data['cpn_id'];
			                $row['cpn_name'] = $data['cpn_name'];
		                	
		                
			}
			$row['cpn_price'] = $data['cpn_price'];
        		$row['o_txtfinalamount'] = $data['o_txtfinalamount'];		    
				$row['payment_type'] = $data['payment_type'];
			$row['payment_orderid'] = $data['payment_orderid'];
		
			$row['o_status'] = $data['o_status'];
			
                	
            
            
		  		  array_push($jsonObj1,$row);

		
		}
		
	
		
		$set['GROCERY_APP'] = $jsonObj1;	

		
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
}


?>