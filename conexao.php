<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "eletronico";
$port = 3306; // Adicione a porta aqui

// Cria a conexão
$conexao = new mysqli($servername, $username, $password, $dbname, $port); // Inclua a porta aqui

// Verifica a conexão
if ($conexao->connect_error) {
  die("Conexão falhou: " . $conexao->connect_error);
}



?>

