<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id_user = $json_decode['id_user'];
$id_follower = $json_decode['id_follower'];

$sql = "DELETE FROM `follower_list` WHERE id_follower = '$id_follower' AND id_user = '$id_user';";

if ($connection->query($sql) === TRUE) {

	$sql = "UPDATE `user`
			SET `follower` = `follower` - 1
			WHERE id = '$id_user'";

	if ($mysqli->query($sql) === TRUE) {
		  $msg = array("status" => 1, "msg" => "Record deleted successfully");
	} else {
		  echo "Error: " . $sql . "<br>" . $mysqli->error;
	}
	
} else {
 	$msg = array("status" => 0, "msg" => "Error: " . $sql . "<br>" . $mysqli->error);
}

$mysqli->close();

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

?>