<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id_game = $json_decode['id_game'];

$sql = "DELETE FROM `game` WHERE id = '$id_game';";

if ($connection->query($sql) === TRUE) {
	$msg = array("status" => 1, "msg" => "Record deleted successfully");
	
} else {
 	$msg = array("status" => 0, "msg" => "Error: " . $sql . "<br>" . $mysqli->error);
}

$mysqli->close();

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

?>