<?php

require("config.php");
require("autorisieren.php");

$sql = "
SELECT MA.id, MA.title, MA.picture, MA.location_id, MA.description, user.name, user.email, MA.status, MA.timestamp 
FROM material MA 
INNER JOIN user ON MA.user_id = user.id 
INNER JOIN location ON MA.location_id = location.id 
ORDER BY MA.timestamp DESC ;
";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}