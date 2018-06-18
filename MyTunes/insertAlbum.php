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

//Connect to database
require_once('db_connect.php');

$album_name = mysqli_real_escape_string($connection,$_POST['album_name']);
$release_date = date('Y-m-d', strtotime($_POST['release_date']));
$price = $_POST['album_price'];
$publisher_id = mysqli_real_escape_string($connection,$_POST['publisher_id']);
$band_id = mysqli_real_escape_string($connection,$_POST['band_id']);

$sql = "INSERT INTO Albums (AlbumID, AlbumName, ReleaseDate, Price, Publishers_PublisherID, Bands_BandID)
        VALUES (null,'$album_name','$release_date','$price', '$publisher_id', '$band_id')";
if(mysqli_query($connection,$sql)){
  echo "Records added Successfully.";
} else {
  echo "ERROR: Cound not execute sql." . mysqli_error($connection);
}
mysqli_close($connection);

 ?>
