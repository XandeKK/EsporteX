<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$sport = $json_decode['sport'];
$image = $json_decode['image']; // base64

$sql = "INSERT INTO `sport`
		VALUES (null, '$sport', '$image')";

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