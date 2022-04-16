<?php
include '../connect.php';

$getData = "SELECT * FROM `state_brazil`";

$qur = $mysqli->query($getData);

while($r = mysqli_fetch_assoc($qur)){
	$msg[] = array("id" => $r['id'], "state" => $r["name"]);	
}
$json = $msg;

header('content-type: application/json');
echo json_encode($json);

$mysqli->close();

?>