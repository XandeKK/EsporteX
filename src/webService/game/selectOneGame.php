<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id_game = $json_decode['id_game'];

$getData = "SELECT game.id, user.name, sport.name, state_brazil.name, city_state_brazil.name, game.start_time, game.end_time, game.date, game.description
FROM game join user
on game.id_organizer = user.id
join sport 
on game.id_sport = sport.id
join state_brazil
on game.id_state = state_brazil.id
join city_state_brazil
on game.id_city = city_state_brazil.id
WHERE game.id = '$id_game';
";

$qur = $connection->query($getData);

while($r = mysqli_fetch_assoc($qur)){
	$msg = array(
		"id_game" => $r['game.id'],
		"organizer" => $r['user.name'],
		"sport" => $r['sport.name'],
		"state" => $r['state_brazil.name'],
		"city" => $r['city_state_brazil.name'],
		"start_time" => $r['start_time'],
		"end_time" => $r['end_time'],
		"date" => $r['date'],
		"description" => $r['description']
	);	
}

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

$mysqli->close();

?>