<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$name = $json_decode['name'];
$username = $json_decode['username'];
$description = $json_decode['description'];
$twitter_username = $json_decode['twitter_username'];
$instagram_username = $json_decode['instagram_username'];
$id_state = $json_decode['id_state'];
$id_city = $json_decode['id_city'];

$getData = "SELECT id FROM `user` WHERE username = '$username'";
$qur = $connection->query($getData);

while($r = mysqli_fetch_assoc($qur)){
    $id = $r['id'];
}

$sql = "UPDATE `user` set 
`name` = '$name', 
`description` = '$description', 
`twitter_username` = '$twitter_username', 
`instagram_username` = '$instagram_username',
 where `id` = '$id';";

if ($connection->query($sql)) {
    $msg = array("status" =>1);

    $sql = "UPDATE `address_user` set `id_state` = '$id_state', `id_city` = '$id_city' where `id_user` = '$id';";

    if ($connection->query($sql)) {
        $msg = array("status" =>1);
    } else {
        $msg = array("status" => $sql . " - " . mysqli_error($connection));
    }

} else {
    $msg = array("status" => $sql . " - " . mysqli_error($connection));
}

$json = $msg;

header('content-type: application/json');
echo json_encode($json);


?>