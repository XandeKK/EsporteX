<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$name = $json_decode['name'];
$username = $json_decode['username'];
$description = $json_decode['description'];
$twitter_username = $json_decode['twitter_username'];
$instagram_username = $json_decode['instagram_username'];

$sql = "INSERT INTO `user`
		VALUES (null, '$name', '$username', '$description', '$twitter_username', '$instagram_username', 0, 0, 0)";

if ($mysqli->query($sql) === TRUE) {
	echo "New record created successfully";
	$msg = array("status" => 1, "msg" => "Your record inserted successfully");
} else {
	$msg = array("status" => 0, "msg" => "Error: " . $sql . "<br>" . $mysqli->error);
	echo "Error: " . $sql . "<br>" . $mysqli->error;
}

$mysqli->close();

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

?>