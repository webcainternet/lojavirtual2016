<?php 
	$tmid = $_GET['tmid'];
	$tmid = str_replace("/", "", $tmid);
?>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />

	<link href="//fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet" type="text/css">
	<link href="//fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet" type="text/css">
	<link href="/catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
</head>

<style type="text/css">
	.container {
	    width: 1170px;
	    margin: auto;
	}
</style>

<body>
<div class="comecaragora">
  <div class="container">
    <div class="row">

      <!-- Modelos -->
      <div class="comecaragora-col3">
        <div class="comecaragora-text3 wca-font2">Modelos</div>
        <div class="quadrdinho" style="margin-left: 0px; background-image: url('/image/catalog/webca/tm/50480-med.jpg');">&nbsp;</div>
        <div class="quadrdinho" style="background-image: url('/image/catalog/webca/tm/51774-med.jpg');">&nbsp;</div>
        <div class="quadrdinho" style="background-image: url('/image/catalog/webca/tm/51838-med.jpg');">&nbsp;</div>
        <div class="comecaragora-text5">
          <a href="//lojavirtual.digital/modelos" target="_parent"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-primary btn-lg btn-block" style="text-transform: uppercase; margin: 10px 3px;">Ver +625</button></a>
        </div>
      </div>



      <!-- Start Express -->
      <div id="comecar-start" style="display: none;">
        <div class="comecaragora-col6">
          <a href="/profissional" target="_parent"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-primary btn-lg btn-block" style="margin-top: 20px; text-transform: uppercase;">Saiba mais</button></a>
        </div>
        <div class="comecaragora-col2">
          <div class="comecaragora-text1 wca-font2">
            <span style="font-size: 18px;color: #f6ae3b;" class="wca-font">Start Express</span>
            R$ 139,90
            <span style="font-size: 14px;">/mês</span>
          </div>
          <div class="comecaragora-text2 wca-font2">Taxa de instalação de R$ 0 a R$ 370</div>
          <div class="comecaragora-text2 wca-font2">dependendo do modelo selecionado</div>
        </div>
      </div>
      

      <!-- Profissional -->
      <div id="comecar-profissional">
        <div class="comecaragora-col6">
          <a href="//lojavirtual.digital/profissional" target="_parent"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-primary btn-lg btn-block" style="margin-top: 20px; text-transform: uppercase;">Saiba mais</button></a>
        </div>
        <div class="comecaragora-col2">
          <div class="comecaragora-text1 wca-font2">
            <span style="font-size: 18px;color: #f6ae3b;" class="wca-font">Profissional</span>
            R$ 2.899,00
          </div>
          <div class="comecaragora-text2 wca-font2">Em até 12x de R$ 241,58 ou preço</div>
          <div class="comecaragora-text2 wca-font2">à vista R$ 2.689,20 (10% de desconto)</div>
        </div>
      </div>



    </div>
  </div>
</div>
</body>
</html>