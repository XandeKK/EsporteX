<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id_organizer = $json_decode['id_organizer'];
$id_sport = $json_decode['id_sport'];
$id_state = $json_decode['id_state'];
$id_city = $json_decode['id_city'];
$start_time = $json_decode['start_time'];
$end_time = $json_decode['end_time'];
$date = $json_decode['date'];
$description = $json_decode['description'];

$sql = "INSERT INTO `game`
		VALUES (
			null, 
			'$id_organizer', 
			'$id_sport', 
			'$id_state', 
			'$id_city', 
			'$start_time', 
			'$end_time', 
			'$date', 
			'$description'
		)";

if ($mysqli->query($sql) === TRUE) {
	echo "New record created successfully";
	$last_id = $mysqli->insert_id;
	$msg = array("status" => 1, "msg" => "Your record inserted successfully", "id_game" => $last_id);
} else {
	$msg = array("status" => 0, "msg" => "Error: " . $sql . "<br>" . $mysqli->error);
	echo "Error: " . $sql . "<br>" . $mysqli->error;
}

$mysqli->close();

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

?>

id`
`id_organizer` 
`id_sport` 
`id_state` 
`id_city` 
`start_time`
`end_time` 
`date` 
`description`