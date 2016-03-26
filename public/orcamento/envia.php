<?php 
$email_from='Fernando Mendes <fernando.mendes@lojavirtual.digital>';
 
if( PATH_SEPARATOR ==';') { 
	$quebra_linha="\r\n";
} elseif (PATH_SEPARATOR==':') { 
	$quebra_linha="\n";
} elseif ( PATH_SEPARATOR!=';' and PATH_SEPARATOR!=':' ) {
	echo ('Esse script não funcionará corretamente neste servidor, a função PATH_SEPARATOR não retornou o parâmetro esperado.');
	$quebra_linha="\r\n";
}
 
//pego os dados enviados pelo formulário 
$nome_para = "Fernando Mendes";
$email = "fernando.mendes@webca.com.br";
$assunto = "Loja Virtual .digital - Proposta de desenvolvimento";

$message = '<html>
<body>
<div style="overflow: hidden;"><div>Olá Cliente,<div><br></div><div>Segue em anexo proposta para desenvolvimento de loja virtual solicitada através de nosso site <a href="https://lojavirtual.digital/" target="_blank">https://lojavirtual.digital/</a></div><div><br></div><div>Qualquer dúvida estamos a disposição através do tel. 11 2376-0583.</div><div><br></div><div>Abraço</div><div><br clear="all"><div><div><div><div><div><div><div><div><div><div><div>--</div><div><br>Obrigado,</div><div>Fernando Mendes</div><div><a href="http://lojavirtual.digital/" style="color:rgb(17,85,204)" target="_blank">http://lojavirtual.digital/</a></div><div><br></div><div>Atendimento:&nbsp;11 2376-0583</div><div><a href="mailto:contato@lojavirtual.digital" style="color:rgb(17,85,204)" target="_blank">contato@lojavirtual.digital</a></div><div><br></div><div><img src="https://lojavirtual.digital/image/catalog/lojalogo_1_mail.png"><br></div><div><hr style="color:rgb(0,0,0);font-family:Times;font-size:medium;border-right-width:0px;border-bottom-width:0px;border-left-width:0px;border-top-style:solid"></div><div><font size="1">Esta mensagem e seus anexos se dirigem exclusivamente ao seu destinatário, pode conter informação privilegiada ou confidencial e é para uso exclusivo da pessoa ou entidade de destino. Se não é vossa senhoria o destinatário indicado, fica notificado de que a leitura, utilização, divulgação e/ou cópia sem autorização pode estar proibidas em virtude da legislação vigente. Se recebeu essa mensagem por erro, rogamos-lhe que nos o comunique imediatamente por esta mesma via e proceda a sua destruição.</font><div></div><div><br></div></div></div></div></div></div></div></div></div></div></div></div><div>
</div><div><br></div></div></div><div>
</div></div>
</body>
</html>';
//formato o campo da mensagem 
$mensagem = wordwrap( $mensagem, 50, "<br>", 1); 
 
/* 
//valido os emails 
if (!preg_match("^([0-9,a-z,A-Z]+)([.,_]([0-9,a-z,A-Z]+))*[@]([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[.]([0-9,a-z,A-Z]){2}([0-9,a-z,A-Z])?$^", $email)){ 
echo"<center>Digite um email valido</center>"; 
echo "<center><a href=\"javascript:history.go(-1)\">Voltar</center></a>"; 
exit;
} 
*/
 
$fp = fopen('/srv/httpd/lojavirtual.digital/lojavirtual2016/public/orcamento/PROPOSTA-SP815-2016.png',"rb"); 
$anexo = fread($fp,filesize('/srv/httpd/lojavirtual.digital/lojavirtual2016/public/orcamento/PROPOSTA-SP815-2016.png')); 
$anexo = base64_encode($anexo); 
 
fclose($fp); 
 
$anexo = chunk_split($anexo); 
 
$boundary = "XYZ-" . date("dmYis") . "-ZYX"; 
 
$mens = "--$boundary" . $quebra_linha . ""; 
$mens .= "Content-Transfer-Encoding: 8bits" . $quebra_linha . ""; 
$mens .= "Content-Type: text/html; charset=\"ISO-8859-1\"" . $quebra_linha . "" . $quebra_linha . ""; //plain 
$mens .= "$mensagem" . $quebra_linha . ""; 
$mens .= "--$boundary" . $quebra_linha . ""; 
$mens .= "Content-Type: application/pdf; name=\"PROPOSTA-SP815-2016.pdf\"" . $quebra_linha . ""; 
$mens .= "Content-Disposition: attachment; filename=\"PROPOSTA-SP815-2016.pdf\"" . $quebra_linha . ""; 
$mens .= "Content-Transfer-Encoding: base64" . $quebra_linha . "" . $quebra_linha . ""; 
$mens .= "$anexo" . $quebra_linha . ""; 
$mens .= "--$boundary--" . $quebra_linha . ""; 
 
$headers = "MIME-Version: 1.0" . $quebra_linha . ""; 
$headers .= "From: $email_from " . $quebra_linha . ""; 
$headers .= "Return-Path: $email_from " . $quebra_linha . ""; 
$headers .= "Content-type: multipart/mixed; boundary=\"$boundary\"" . $quebra_linha . ""; 
$headers .= "$boundary" . $quebra_linha . ""; 
 
//envio o email com o anexo 
mail($email,$assunto,$mens,$headers, "-r"."fernando.mendes@lojavirtual.digital"); 
 
echo"Email enviado com Sucesso!"; 
 
?>