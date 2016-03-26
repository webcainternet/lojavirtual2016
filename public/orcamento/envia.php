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
<div dir=3D"ltr">Ol=C3=A1 Cliente,<div><br></div><div>Segue em anexo propos=
ta para desenvolvimento de loja virtual solicitada atrav=C3=A9s de nosso si=
te <a href=3D"https://lojavirtual.digital/">https://lojavirtual.digital/</a=
></div><div><br></div><div>Qualquer d=C3=BAvida estamos a disposi=C3=A7=C3=
=A3o atrav=C3=A9s do tel. 11 2376-0583.</div><div><br></div><div>Abra=C3=A7=
o</div><div><br clear=3D"all"><div><div class=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div dir=3D"ltr"><div>--</div><div><br>Obrigado,</div><div>Fernando Mendes<=
/div><div><a href=3D"http://lojavirtual.digital/" style=3D"color:rgb(17,85,=
204)" target=3D"_blank">http://lojavirtual.digital/</a></div><div><br></div=
><div>Atendimento:=C2=A011 2376-0583</div><div><a href=3D"mailto:contato@lo=
javirtual.digital" style=3D"color:rgb(17,85,204)" target=3D"_blank">contato=
@lojavirtual.digital</a></div><div><br></div><div><img src=3D"https://docs.=
google.com/a/webca.com.br/uc?id=3D0ByI9A2i8ua70WnpqV0JIWVpRS0E&amp;export=
=3Ddownload"><br></div><div><hr style=3D"color:rgb(0,0,0);font-family:Times=
;font-size:medium;border-right-width:0px;border-bottom-width:0px;border-lef=
t-width:0px;border-top-style:solid"></div><div><font size=3D"1">Esta mensag=
em e seus anexos se dirigem exclusivamente ao seu destinat=C3=A1rio, pode c=
onter informa=C3=A7=C3=A3o privilegiada ou confidencial e =C3=A9 para uso e=
xclusivo da pessoa ou entidade de destino. Se n=C3=A3o =C3=A9 vossa senhori=
a o destinat=C3=A1rio indicado, fica notificado de que a leitura, utiliza=
=C3=A7=C3=A3o, divulga=C3=A7=C3=A3o e/ou c=C3=B3pia sem autoriza=C3=A7=C3=
=A3o pode estar proibidas em virtude da legisla=C3=A7=C3=A3o vigente. Se re=
cebeu essa mensagem por erro, rogamos-lhe que nos o comunique imediatamente=
 por esta mesma via e proceda a sua destrui=C3=A7=C3=A3o.</font><br></div><=
/div></div></div></div></div></div></div></div></div></div>
<div dir=3D"ltr"><br></div></div></div>
</body>
</html>
';

// To send HTML mail, the Content-type header must be set
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

// Additional headers
$headers .= 'To: Fernando Mendes <fernando.mendes@webca.com.br>' . "\r\n";
//$headers .= 'To: Fernando Mendes <fernando.mendes@webca.com.br>, Kelly <kelly@example.com>' . "\r\n";
$headers .= 'From: Fernando Mendes <fernando.mendes@lojavirtual.digital>' . "\r\n";
//$headers .= 'Cc: birthdayarchive@example.com' . "\r\n";
//$headers .= 'Bcc: birthdaycheck@example.com' . "\r\n";

// Mail it
mail($to, $subject, $message, $headers);
?>