<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$id_user = $json_decode['id_user'];
$id_follow = $json_decode['id_follow'];

$sql = "DELETE FROM `follow_list` WHERE id_follow = '$id_follow' AND id_user = '$id_user';";

if ($connection->query($sql) === TRUE) {

	$sql = "UPDATE `user`
			SET `follow` = `follow` - 1
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