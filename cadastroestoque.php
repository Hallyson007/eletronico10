<?php

include 'conexao.php';

$idprodutos = $_POST['idprodutos'];
$quantidade = $_POST['quantidade'];
$data_modificacao = date('Y-m-d H:i:s');

$sql = "INSERT INTO `estoque` (`idprodutos`, `quantidade`, `data_modificacao`) VALUES ('$idprodutos', '$quantidade', '$data_modificacao')";

$inserir = mysqli_query($conexao, $sql);

if (!$inserir) {
    echo "Erro: " . mysqli_error($conexao);
} else {
    header('Location: formestoque.php');
}

?>
