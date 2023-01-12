<?php

require_once('config.php');
require_once('autorisieren.php');

$userID = $_POST["userID"];
$titel = $_POST["titel"];
$beschreibung = $_POST["beschreibung"];
$stadt = $_POST["stadt"];
$status = $_POST["status"];

$bild = $_POST["bild"];

$wgID = $_POST["camID"];

$sql = "UPDATE material SET title=?, picture=?, location_id=?, description=?, status=? WHERE user_id=?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$titel, $bild, $stadt, $beschreibung, $status, $userID]);

if ($erfolg) {
    
    print_r('Cam erfolgreich aktualisiert!');

} else {

    print_r($erfolg);

};