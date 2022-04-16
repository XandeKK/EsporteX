<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$username = $json_decode['username'];

$getData = "SELECT * FROM `user` WHERE `username` = '$username'";

$qur = $mysqli->query($getData);

while($r = mysqli_fetch_assoc($qur)){
	$msg[] = array(
		"id" => $r['id'],
		"name" => $r['name'],
		"username" => $r['username'],
		"description" => $r['description'],
		"twitter_username" => $r['twitter_username'],
		"instagram_username" => $r['instagram_username'],
		"follow" => $r['follow'],
		"follower" => $r['follower']
		"participant" => $r['participant']
	);	
}
$json = $msg;

header('content-type: application/json');
echo json_encode($json);

$mysqli->close();

?>