<?php

$conn = new MySqli("localhost:3306", "root", "1234", "unisidebd");
if(!$conn){
    die("Erro ao se conectar no banco de dados");
}