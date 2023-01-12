<?php

require('config.php');
require('autorisieren.php');

$user =  $_POST["user"];

$titel = $_POST["titel"];
$bild = $_POST["bild"];
$beschreibung = $_POST["beschreibung"];
$stadt = $_POST["stadt"];
$status = $_POST["status"];

$sql = "INSERT INTO material (title, picture, location_id, description, user_id, status) VALUES (:Title, :Picture, :Location_id, :Description, :User_id, :Status)";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute(array('Title' => $titel, 'Picture' => $bild, 'Location_id' => $stadt, 'Description' => $beschreibung, 'User_id' => $user, 'Status' => $status));

if ($erfolg) {

    print_r('Cam erfolgreich erstellt!');

} else {

    print_r($erfolg);
};