<?php



    function send_notification($tokens,$body,$o_id) {
     
                $url = "https://fcm.googleapis.com/fcm/send";
                $token = $tokens;
            $serverKey = 'AAAA2_AjOcM:APA91bHJS1QvkaUGXeMTiOx1U9g3r4x2AvmlrQG9xAsTezLOAzgI__IU5Jhzwat1Qyev2SqdEKpcr0WS-4p1NA1DgqnVFu34lyOtDWPhPTft4UzesSHuXp16wWWfbvs9sWp_PP466JsL';
                $title = "Grocery Store";
              $type = $o_id;
  
                $notification = array(
                    'title' =>$title , 
                    'body' => $body, 
                    'sound' => 'default',
                    'badge' => '1'
                    );
                
                $arrayToSend = array('to' => $token, 'notification' => $notification,'priority'=>'high' ,
                 'data' => [ 'type' => $type  ]
                );
                        
                $json = json_encode($arrayToSend);
                $headers = array();
                $headers[] = 'Content-Type: application/json';
                $headers[] = 'Authorization: key='. $serverKey;
                $ch = curl_init();
             
               curl_setopt ( $ch, CURLOPT_URL, $url );
                curl_setopt ( $ch, CURLOPT_POST, true );
                curl_setopt ( $ch, CURLOPT_HTTPHEADER, $headers );
                curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
                curl_setopt ( $ch, CURLOPT_POSTFIELDS, $json );
    
                 $result = curl_exec($ch);
                 curl_close($ch);
     }
    
      /* function send_notification_test($tokens) {
     
            $url = "https://fcm.googleapis.com/fcm/send";
            $token = $tokens;
            $serverKey = 'AAAAWWaGsn4:APA91bEN9TkTUOIPm3xcUCqdprakeesHvN8arceoxJSVNdQa3KSmE16leeL-y4ENckpHXERXC3HNnZ-lWW9JQLC8LJZY3wY60VOVWreAdNbF6eQ5HUDiT0p-Dx1FuLZZ8580vi24Tlr2';
            $title = "Notification title";
            $body=	"this is for testing purpose";
            $type="sent";
            

 						
            $notification = array('title' =>$title , 'body' => $body, 'sound' => 'default', 'badge' => '1');
        
        
        $arrayToSend = array('to' => $token, 'notification' => $notification,'priority'=>'high','type' => $type );
            
            $json = json_encode($arrayToSend);
            $headers = array();
            $headers[] = 'Content-Type: application/json';
            $headers[] = 'Authorization: key='. $serverKey;
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
            curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
        
       $result = curl_exec($ch );
	   $result = json_decode($result, true);
	   if($result['success'] == 1){
			$response['status'][] = array( 
 								  'status'	=>'1',
 								  'title' =>$title , 
 								  'body' => $body
 								);
	   }
	   else{
			$response['status'][] = array( 
 								  'status'	=>'0'
 								);
	   }
        curl_close( $ch );
        echo json_encode($response);
 
    }
*/
 
?>
