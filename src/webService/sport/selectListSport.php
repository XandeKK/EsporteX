<?php
include '../connect.php';

$getData = "SELECT * FROM sport";

$qur = $mysqli->query($getData);

while($r = mysqli_fetch_assoc($qur)){
	$msg[] = array("id" => $r['id'], "sport" => $r['name'], "image" => $r["image"]);	
}

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

@mysqli_close($conn);

?>