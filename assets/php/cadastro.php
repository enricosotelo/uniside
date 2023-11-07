<?php

include "conecta.php";



$nome = $_POST["nome"];
$ra = $_POST["ra"];
$ra = filter_var($ra, FILTER_SANITIZE_NUMBER_INT); // DEIXA APENAS OS NUMEROS
$email = $_POST["email"];
$senha = $_POST["password"];

$sql = "INSERT INTO unisidebd.users(nome,ra,email,senha) VALUES(?,?,?,?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("siss", $nome, $ra, $email, $senha);
$stmt->execute();

// aqui tem q direcionar para uma pagina que diz q foi cadastrado e q tenha um botão para se logar que leve para tela de login
header("location: login.html");

?>

