<?php
header('Content-Type: text/html; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header("Content-Type: application/json");

	$pdo = new PDO('mysql:host=localhost;dbname=u32872', 'root', '');
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$pdo->exec('SET CHARACTER SET utf8'); 
	 
?>
