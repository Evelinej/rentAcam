<?php

require_once('config.php');
require_once('autorisieren.php');

$userID = $_POST["userID"];
$camID = $_POST["camID"];

$sql = "DELETE FROM material WHERE user_id = ? AND id = ?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$userID, $camID]);

if ($erfolg) {

    print_r('Cam erfolgreich gelöscht!');

} else {

    print_r($erfolg);
};