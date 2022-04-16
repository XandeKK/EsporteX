<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$username = $json_decode['username'];

$getData = "SELECT id FROM `user` WHERE username = '$username'";
$qur = $connection->query($getData);

while($r = mysqli_fetch_assoc($qur)){
    $id = $r['id'];
}

$getData = "SELECT sport.name
FROM sport_user join user
on sport_user.id_user = user.id
join sport 
on sport_user.id_sport = sport.id
WHERE user.id = '$id';
";

$qur = $connection->query($getData);

while($r = mysqli_fetch_assoc($qur)){
	$msg[] = array("sport" => $r['name']);	
}

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

@mysqli_close($conn);

?>