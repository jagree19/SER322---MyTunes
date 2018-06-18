<?php

require_once('db_connect.php');

$id = mysqli_real_escape_string($connection,$_POST['musician_id']);
$musician_name = mysqli_real_escape_string($connection,$_POST['musician_name']);
$birth_date = date('Y-m-d', strtotime($_POST['birth_date']));
$instrument = mysqli_real_escape_string($connection,$_POST['musician_instrument']);

$sql = "UPDATE Musicians SET Name='$musician_name', Instrument='$instrument', BirthDate='$birth_date' WHERE MusicianID = '$id'";
if(mysqli_query($connection,$sql)){
  echo "Records added Successfully.";
} else {
  echo "ERROR: Cound not execute sql." . mysqli_error($connection);
}
mysqli_close($connection);

 ?>
