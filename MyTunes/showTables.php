<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-eqiv="X-UA-Compatible" content="IE-edge">
  <meta name="viewport" content="width-device-width, initial-scale=1">
  <title>Show Tables</title>
  <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="margin:16px;padding:16px">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<?php

/*
Modified code from answer by waLL e
at https://stackoverflow.com/questions/17902483/show-values-from-a-mysql-database-table-inside-a-html-table-on-a-webpage

dynamic display of table data utilizing php and MySQL

*/
//Connect to database
require_once('db_connect.php');

//get query string from button click on start page
if(isset($_GET["sqlquery"])) {
  $qstring = $_GET["sqlquery"];
}

//get results from database
$table = mysqli_real_escape_string($connection,$_POST['table_name']);
$query = "SELECT * FROM ".$table.";";
$result = mysqli_query($connection,$query);
$all_elements = array(); // declare array for saving property

//showing property
echo '<table class="table table-bordered"
        cellspacing="5" cellpadding="8">
        <tr class = "data-heading">';  //init table tag
while ($elements = mysqli_fetch_field($result)) {
  echo '<th>' . $elements->name . '</th>'; //get field name for header
  array_push($all_elements, $elements->name);
}
echo '<tr>';

//showing all data
while ($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  foreach ($all_elements as $item) {
    echo '<td>' . $row[$item] . '</td>'; //get items using property value
  }
  echo '</tr>';
}
echo "</table>";

 ?>
</body>
</html>
