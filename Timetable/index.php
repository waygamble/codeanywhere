<?php
/*
 *Using SimpleXML to update xml data
 */
//prevent form redirect
if(isset($_SERVER['HTTP_REFERER'])){
  header("Location: ".$_SERVER['HTTP_REFERER']);
}
else{
  echo"Error";
}

//store form date in variables
$name = $_POST["name"];
$lecturer = $_POST["lecturer"];
$day = $_POST["day"];
$time = $_POST["time"];
$room = $_POST["room"];

//check if xml file exists
if(file_exists('timetable.xml')){
  //load date from xml file into xml variable
  $xml = simplexml_load_file('timetable.xml');
  //add new book element to variable
  $newChild = $xml->addChild('module');
  $newChild->addChild('name', $name);
  $newChild->addChild('lecturer', $lecturer);
  $newChild->addChild('day', $day);
  $newChild->addChild('time', $time);
  $newChild->addChild('room', $room);
}
else{
  exit('Failed to open timetable.xml');//error message
}

//save new date from variable back into an xml file
file_put_contents('/home/cabox/workspace/Timetable/timetable.xml',$xml->asXML());

?>