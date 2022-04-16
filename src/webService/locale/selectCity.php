<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id = $json_decode['id'];

$getData = "SELECT id, name FROM `city_state_brazil` WHERE id_state = '$id'";

$qur = $mysqli->query($getData);

while($r = mysqli_fetch_assoc($qur)){
	$msg[] = array("id" => $r['id'], "city" => $r["name"]);	
}
$json = $msg;

header('content-type: application/json');
echo json_encode($json);

$mysqli->close();

?>