<?php

require_once('db_connect.php');

$id = mysqli_real_escape_string($connection,$_POST['musician_id']);
$first_name = mysqli_real_escape_string($connection,$_POST['first_name']);
$last_name = mysqli_real_escape_string($connection,$_POST['last_name']);
$email = mysqli_real_escape_string($connection,$_POST['email_address']);
$phone = $_POST['phone_number'];

$sql = "UPDATE MUSICIAN SET firstName='$first_name', lastName='$last_name', emailAddress='$email', phoneNumber='$phone' WHERE MusicianID = '$id'";
if(mysqli_query($connection,$sql)){
  echo "Records added Successfully.";
} else {
  echo "ERROR: Cound not execute sql." . mysqli_error($connection);
}
mysqli_close($connection);

 ?>
