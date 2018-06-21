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

require_once('db_connect.php');

$name = mysqli_real_escape_string($connection,$_POST['producer_name']);
$email = mysqli_real_escape_string($connection,$_POST['email']);
$phone = $_POST['phone_number'];


$sql = "INSERT INTO PRODUCER (ProducerID, producerName, emailAddress, phoneNumber) VALUES (null,'$name', '$email','$phone')";
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
