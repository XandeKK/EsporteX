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

$getData = "SELECT user.id, user.name
FROM follower_list join user
on follower_list.id_user = user.id
WHERE user.id = '$id';
";

$qur = $connection->query($getData);

while($r = mysqli_fetch_assoc($qur)){
	$msg[] = array("id" => $r['id'], "name" => $r['name']);	
}

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

@mysqli_close($conn);

?>