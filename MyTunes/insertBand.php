<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-eqiv="X-UA-Compatible" content="IE-edge">
  <meta name="viewport" content="width-device-width, initial-scale=1">
  <title>Successful Add</title>
  <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="margin:16px;padding:16px">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

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
$genre = mysqli_real_escape_string($connection,$_POST['genre']);
$start_date = date('Y-m-d', strtotime($_POST['start_date']));
$end_date = date('Y-m-d', strtotime($_POST['end_date']));


$sql = "INSERT INTO BAND (BandID, bandName, genre, startDate, endDate) VALUES (null,'$band_name', 'genre', '$start_date','$end_date')";
if(mysqli_query($connection,$sql)){
  echo "Records added Successfully.";
  echo "<br />";
  echo "<a class='btn btn-success' href='MyTunes_index.html'>Return Home</a>";
} else {
  echo "ERROR: Cound not execute sql." . mysqli_error($connection);
}
mysqli_close($connection);

 ?>
</body>
</html>
