<?php

$host = "localhost";
$user = "796765_3_1";
$password = "Nij@20AguG3s";
$dbname = "796765_3_1";

$pdo = new PDO('mysql:host='. $host . '; dbname=' . $dbname . ';charset=utf8', $user, $password);
$pdo->exec("set names utf8");