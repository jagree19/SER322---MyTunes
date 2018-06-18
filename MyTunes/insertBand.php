<?php

// $host = '127.0.0.1'; //host address
// $user = 'tester'; //change to user name for database
// $pass = '1234outfd'; //change to password for database
// $dbName = 'MyTunes1.0'; // change to database name
//
// //create connection
// $connection = mysqli_connect($host, $user, $pass, $dbName);
//
// //test for failure
// if(mysqli_connect_errno()) {
//   die("connection failed: "
//     . mysqli_connect_error()
//     . " (" . mysqli_connect_errno()
//     . ")");
// }

require_once('db_connect.php');

$band_name = mysqli_real_escape_string($connection,$_POST['band_name']);
$band_founded = date('Y-m-d', strtotime($_POST['band_founded']));
$band_disbanded = date('Y-m-d', strtotime($_POST['band_disbanded']));

$sql = "INSERT INTO Bands (BandID, BandName, Founded, Disbanded) VALUES (null,'$band_name','$band_founded','$band_disbanded')";
if(mysqli_query($connection,$sql)){
  echo "Records added Successfully.";
} else {
  echo "ERROR: Cound not execute sql." . mysqli_error($connection);
}
mysqli_close($connection);

 ?>