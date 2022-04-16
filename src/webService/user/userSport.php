<?php
include '../connect.php';

header('Content-type: application/json');
$json = file_get_contents('php://input');
$json_decode = json_decode($json, true); 

$username = $json_decode['username'];
$id_sports = $json_decode['id_sports'];

$getData = "SELECT id FROM `user` WHERE username = '$username'";
$qur = $connection->query($getData);

while($r = mysqli_fetch_assoc($qur)){
    $id = $r['id'];
}

$sql = "DELETE FROM `sport_user` WHERE `id_user` = '$id';";

if ($connection->query($sql) === TRUE) {

	foreach ($id_sports as $sport) {
		$sql = "INSERT INTO `sport_user`
			VALUES ('$sport', '$id_user')";

		if ($mysqli->query($sql) === TRUE) {
			echo "New record created successfully";
			$msg[] = array("status" => 1, "msg" => "Your record inserted successfully");
		} else {
			$msg[] = array("status" => 0, "msg" => "Error: " . $sql . "<br>" . $mysqli->error);
			echo "Error: " . $sql . "<br>" . $mysqli->error;
		}
	}

} else {
  echo "Error deleting record: " . $connection->error;
}

$mysqli->close();

$json = $msg;

header('content-type: application/json');
echo json_encode($json);

?>