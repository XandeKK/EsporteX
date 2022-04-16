<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id_user = $json_decode['id_user'];
$id_follower = $json_decode['id_follower'];

$sql = "INSERT INTO `follower_list`
		VALUES ('$id_user', '$id_follower')";

if ($mysqli->query($sql) === TRUE) {
	echo "New record created successfully";
	
	$sql = "UPDATE `user`
			SET `follower` = `follower` + 1
			WHERE id = '$id_user'";

	if ($mysqli->query($sql) === TRUE) {
		  $msg = array("status" => 1, "msg" => "Your record inserted successfully");
	} else {
		  echo "Error: " . $sql . "<br>" . $mysqli->error;
	}

} else {
	$msg = array("status" => 0, "msg" => "Error: " . $sql . "<br>" . $mysqli->error);
	echo "Error: " . $sql . "<br>" . $mysqli->error;
}

$mysqli->close();

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

?>