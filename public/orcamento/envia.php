<?php
// multiple recipients
$to  = 'fernando.mendes@webca.com.br';
//$to .= ', '.'wez@example.com';

// subject
$subject = 'Loja Virtual .digital - Proposta de serviço';

// message
$message = '
<html>
<body>
<div style="overflow: hidden;"><div>Olá Cliente,<div><br></div><div>Segue em anexo proposta para desenvolvimento de loja virtual solicitada através de nosso site <a href="https://lojavirtual.digital/" target="_blank">https://lojavirtual.digital/</a></div><div><br></div><div>Qualquer dúvida estamos a disposição através do tel. 11 2376-0583.</div><div><br></div><div>Abraço</div><div><br clear="all"><div><div><div><div><div><div><div><div><div><div><div>--</div><div><br>Obrigado,</div><div>Fernando Mendes</div><div><a href="http://lojavirtual.digital/" style="color:rgb(17,85,204)" target="_blank">http://lojavirtual.digital/</a></div><div><br></div><div>Atendimento:&nbsp;11 2376-0583</div><div><a href="mailto:contato@lojavirtual.digital" style="color:rgb(17,85,204)" target="_blank">contato@lojavirtual.digital</a></div><div><br></div><div><img src="https://lojavirtual.digital/image/catalog/lojalogo_1_mail.png"><br></div><div><hr style="color:rgb(0,0,0);font-family:Times;font-size:medium;border-right-width:0px;border-bottom-width:0px;border-left-width:0px;border-top-style:solid"></div><div><font size="1">Esta mensagem e seus anexos se dirigem exclusivamente ao seu destinatário, pode conter informação privilegiada ou confidencial e é para uso exclusivo da pessoa ou entidade de destino. Se não é vossa senhoria o destinatário indicado, fica notificado de que a leitura, utilização, divulgação e/ou cópia sem autorização pode estar proibidas em virtude da legislação vigente. Se recebeu essa mensagem por erro, rogamos-lhe que nos o comunique imediatamente por esta mesma via e proceda a sua destruição.</font><div></div><div><br></div></div></div></div></div></div></div></div></div></div></div></div><div>
</div><div><br></div></div></div><div>
</div></div>
</body>
</html>
';

// To send HTML mail, the Content-type header must be set
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";

// Additional headers
$headers .= 'To: Fernando Mendes <fernando.mendes@webca.com.br>' . "\r\n";
//$headers .= 'To: Fernando Mendes <fernando.mendes@webca.com.br>, Kelly <kelly@example.com>' . "\r\n";
$headers .= 'From: Fernando Mendes <fernando.mendes@lojavirtual.digital>' . "\r\n";
//$headers .= 'Cc: birthdayarchive@example.com' . "\r\n";
//$headers .= 'Bcc: birthdaycheck@example.com' . "\r\n";

// Mail it
mail($to, $subject, $message, $headers);
?>