<?php
  //prevent form redirect
  if(isset($_SERVER['HTTP_REFERER'])){
    header("Location: ".$_SERVER['HTTP_REFERER']);
  }
  else{
    echo"Error";
  }

  //store form date in variables
 $post_description = $_POST["post_description"];
 $post_username = "username goes here"; //$_POST["username"];

  if(file_exists('destinations.xml')){
      //load date from xml file into xml variable
      $xml = simplexml_load_file('destinations.xml');
      //add new element to variable
      $xml->country->post->addChild('post_description', $post_description);
      $xml->country->post->addChild('post_username', $post_username);
      
    }
  else{
    exit('Failed to open timetable.xml');//error message
  }

  
  //save new date from variable back into an xml file
 file_put_contents('/home/cabox/workspace/project/destinations.xml',$xml->asXML());
?>