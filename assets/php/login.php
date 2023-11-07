<?php

session_start();


if (empty($_POST) || empty($_POST["ra"]) || empty($_POST["senha"])) {
    // Se algum dos campos estiver vazio, redireciona de volta para a página de login 
    header("location: login.html");
}

include "conecta.php";

$usuario = $_POST["ra"];
$senha = $_POST["senha"];

$sql = "SELECT * FROM users WHERE ra = '$usuario' AND senha = '$senha'";

$res = $conn->query($sql) or die($conn->error);

$row = $res->fetch_object();

$qtd = $res->num_rows;

if ($qtd > 0) {
    $_SESSION["ra"] = $usuario;
    $_SESSION["nome"] = $row->nome;

    // Redireciona para a página do feed
    header('Location: ./sobre.html');
} else {
    // Se não houver resultados na consulta, exibe um alerta e redireciona de volta para a página de login 
    print "<script>alert('RA ou senha inválidos');</script>";
    print "<script>location.href='login.html';</script>";
}
