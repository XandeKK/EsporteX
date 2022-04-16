<?php
$mysqli = new mysqli("localhost","root","44528Database","DatabaseEsporteX");

// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  $error = $mysqli -> connect_error;
  return $error; // return string
}else {
  return $mysqli; // return object
}
?>