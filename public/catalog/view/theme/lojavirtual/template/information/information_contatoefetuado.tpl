<?php
      $nome = $_GET["nome"];
      $ddd  = $_GET["ddd"];
      $tel  = $_GET["telefone"];

      $Name = "Loja Virtual .digital - Contato"; //senders name 
      $email = "contato@lojavirtual.digital"; //senders e-mail adress 
      $recipient = "fernando.mendes@lojavirtual.digital"; //recipient 
      $mail_body = "Nome: ".$nome." Telefone: ".$ddd." ".$tel; //mail body 
      $subject = "Loja Virtual .digital - Contato através do site"; //subject 
      $header = "From: ". $Name . " <" . $email . ">\r\n"; //optional headerfields 

      mail($recipient, $subject, $mail_body, $header);
?>
