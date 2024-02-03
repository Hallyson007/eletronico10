<?php

include 'conexao.php';

$nome = $_POST['produto']; // Altere 'produto' para 'nome'
$descricao = $_POST['descricao'];
$categoria = $_POST['categoria'];
$estoque = $_POST['estoque'];
$preco = $_POST['preco'];

$sql = "INSERT INTO `produtos` (`nome`, `descricao`, `categoria`, `estoque`, `preco`) VALUES ('$nome','$descricao','$categoria','$estoque','$preco')"; // Altere 'produto' para 'nome'

$inserir = mysqli_query($conexao,$sql);

if (!$inserir) {
    echo "Erro: " . mysqli_error($conexao);
} else {
    header('Location: formproduto.php');
}

?>
