<?php

// $host = '127.0.0.1'; //host address
// $user = 'tester'; //change to user name for database
// $pass = '1234outfd'; //change to password for database
// $dbName = 'MyTunes1.0'; // change to database name

$host = 'mytunes1-2.c2kfwcjpb96b.us-west-1.rds.amazonaws.com'; //host address
$user = 'Master'; //change to user name for database
$pass = '1234outfd'; //change to password for database
$dbName = 'MyTunes1.0'; // change to database name

//create connection
$connection = mysqli_connect($host, $user, $pass, $dbName);

//test for failure
if(mysqli_connect_errno()) {
  die("connection failed: "
    . mysqli_connect_error()
    . " (" . mysqli_connect_errno()
    . ")");
}
?>
