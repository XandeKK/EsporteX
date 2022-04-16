<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id_gamer = $json_decode['id_game'];
$id_sport = $json_decode['id_sport'];
$id_state = $json_decode['id_state'];
$id_city = $json_decode['id_city'];
$start_time = $json_decode['start_time'];
$end_time = $json_decode['end_time'];
$date = $json_decode['date'];
$description = $json_decode['description'];

$sql = "UPDATE `game` set 
`id_sport` = '$id_sport', 
`id_state` = '$id_state', 
`id_city` = '$id_city', 
`start_time` = '$start_time',
`end_time` = '$end_time', 
`date` = '$date', 
`description` = '$description',
 where `id` = '$id_game';";

if ($connection->query($sql)) {
    $msg = array("status" =>1);

} else {
    $msg = array("status" => $sql . " - " . mysqli_error($connection));
}

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

?>