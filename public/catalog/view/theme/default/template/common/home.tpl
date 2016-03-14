<?php echo $header; ?>

<?php /* css-compress.php -- <link rel="stylesheet" type="text/css" href="load/skin_allsizes_white.css"/> */ ?>


<style type="text/css">.select-home { border-bottom: solid 2px #FCAD3A !important; color: #FCAD3A !important; }</style>

<? /* ************************************************************************************
    Slider
************************************************************************************* */ ?>
<link href="/catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="/catalog/view/javascript/jquery/owl-carousel/owl.theme.css" rel="stylesheet">

<style type="text/css">
/* Somente na home */
.product-thumb {
    border: 0px;
}
.product-thumb .caption {
    min-height: 120px;
}
.product-thumb .button-group {
    display: none;
}
</style>

<div style="display: none;"><center><h2 style="font-size: 32px;">Aqui a <span class="wca-font2" style="text-transform: uppercase; color: #757474;">LojaVirtual</span> <span class="wca-font wca-amarela" style="text-transform: none;">.digital</span> desenvolve para você.</h2></center></div>

<div id="demo">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div id="owl-demo" class="owl-carousel">
            <div class="item"><img src="/image/catalog/banners/escolha_seu_template_1170.jpg" alt="Escolha o modelo e nós montamos sua loja completa!">
              <div class="slider-container">
                <div class="slider-titulo-modelo">
                  Escolha o modelo e nós<br>montamos sua loja completa!<br>
                  <a href="/modelos"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-primary-modelos btn-lg btn-block" style="margin-top: 20px; text-transform: uppercase;">Escolher modelo</button></a>
                </div>
              </div>
            </div>
            <div class="item"><img src="/image/catalog/banners/mago_e_seu_dragao_1170.jpg" alt="Acompanhe seus pedidos de qualquer lugar!">
              <div class="slider-container">
                <div class="slider-titulo-acompanhe">
                  Acompanhe seus pedidos<br>de qualquer lugar!<br>
                  <a href="/modelos"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-primary-comecar btn-lg btn-block" style="margin-top: 20px; text-transform: uppercase;">Começar agora</button></a>
                </div>
              </div>
            </div>
            <div class="item"><img src="/image/catalog/banners/cadastro_de_produtos_2_1170.jpg" alt="Cadastre seus produtos e gerencie seu estoque com facilidade!">
              <div class="slider-container">
                <div class="slider-titulo-estoque">
                  Cadastre seus produtos e gerencie<br>seu estoque com facilidade!<br>
                  <a href="/modelos"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-primary-comecar2 btn-lg btn-block" style="margin-top: 20px; text-transform: uppercase;">Começar agora</button></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>


<? /* ************************************************************************************
    TEMPLATES - CoverFlow
************************************************************************************* */ ?>
<div class="container-titulo" style="background-color: #F8F8F8;">
  <div class="container">
    <div class="row">
      <div style="font-size: 14px; margin: 30px 0px 0px 0px; text-align: center; color: #757474;">
        <center><h2 style="font-size: 32px;">São mais de <span class="wca-font wca-amarela" style="text-transform: none;">650 modelos</span> já prontos.</h2></center>
      </div>
    </div>
  </div>
</div>

<div class="container-tema">
  <div class="container">
    <div class="row">

      <div id="content" class="<?php echo $class; ?>" style="min-height: 10px;">
        <div id="myDiv"></div>
          <ul id="coverflowData">
            <ul data-cat=" ">
            <?php
              $arrmodelos = array(54890, 55818, 52864, 57928, 57564, 52694, 57929, 58164, 53800, 53325);

              while (list ($key, $val) = each ($arrmodelos) ) echo '<ul>
                <li data-type="link" data-url="http://demo.lojavirtual.digital/demo/?tmid='.$val.'" data-target="_blank"></li>
                  <li data-thumbnail-path="/image/catalog/webca/tm/'.$val.'-med.jpg"></li>
                  <li data-thumbnail-text="">
                    <p class="largeLabel"></p>
                    <p class="smallLabel"></p>
                  </li>
                  <li data-info="">
                    <p class="mediaDescriptionHeader"></p>
                    <p class="mediaDescriptionText"></p>
                  </li>
                </ul>'; 
            ?>
              <ul>
                <li data-type="link" data-url="/modelos"></li>
                  <li data-thumbnail-path="/image/catalog/lojavirtual/maismodelos.png"></li>
                  <li data-thumbnail-text="">
                    <p class="largeLabel"></p>
                    <p class="smallLabel"></p>
                  </li>
                  <li data-info="">
                    <p class="mediaDescriptionHeader"></p>
                    <p class="mediaDescriptionText"></p>
                  </li>
                </ul>
            </ul>
          </ul>

          <a href="/modelos"><div style="text-align: center; margin: auto; width: 300px;"><input class="newsletter-contato btn btn-inverse btn-block btn-lg dropdown-toggle" style="width: 300px;" type="submit" required="" name="contato" value="Veja todos os modelos!"></div></a>
        </div>
      </div>
    </div>
  </div>
</div>





<? /* ************************************************************************************
    Passos para compra
************************************************************************************* */ ?>
<div class="container"> 
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <div class="container-info2">
        <div class="container">
          <div class="row">
            <div id="content" class="<?php echo $class; ?>" style="min-height: 10px;">
              
              <div class="row">
                <div class="col-lg-12" style="padding: 20px; color: #333; font-size: 32px;">
                    <center><h2 style="font-size: 32px;">Está <span class="wca-font wca-amarela" style="text-transform: none;">tudo pronto</span> para você começar agora</h2></center>
                </div>
              </div>

              <div class="container-passos">
                  <div class="container-passos-img" style="background-image: url('/image/catalog/banners/icones/icone2.jpg'); background-color: #FF9999;">&nbsp;</div>
                  <div class="container-passos-titulo">Cadastre seus produtos com maior facilidade</div>
                  <div>
                      Faça o cadastro de seus produtos através de nossa plataforma de administração e fique a vontade para fazer modificações quando quiser sem a necessidade um desenvolvedor. <br /><br /> Você pode contar também com suporte técnico de nossa central de atendimento ou utilizar a manutenção mensal de nossos desenvolvedores.
                  </div>
                </div>

                <div class="container-passos">
                  <div class="container-passos-img" style="background-image: url('/image/catalog/banners/icones/icone3.jpg'); border-radius: 0px; background-color: white;">&nbsp;</div>
                  <div class="container-passos-titulo">Integração com gateways de pagamento mais comuns</div>
                  <div style="padding-bottom: 15px;">
                      Venda seus produtos e receba o pagamento através de cartão de crédito, débito, boleto ou transferência bancária. Você ainda pode dar a possibilidade de parcelamento.
                  </div>
                  <img src="/image/catalog/webca/bandeiras.png">
                </div>

                <div class="container-passos">
                  <div class="container-passos-img" style="background-image: url('/image/catalog/banners/icones/icone1.jpg');">&nbsp;</div>
                  <div class="container-passos-titulo">Cálculo de frete automático via Correios</div>
                  <div style="padding-bottom: 15px;">
                      O valor do frete de seus produtos é calculado automaticamente em sua loja e você precisa apenas enviar os pedidos.
                  </div>
                  <img src="/image/catalog/webca/correios.png">
                </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<? /* ************************************************************************************
    Planos
*************************************************************************************
<a name="planos"></a>
<div class="container-plan">
  <div class="row" style="margin-left: 0px;background-color: white;margin-right: 0px;">
    <div id="content" class="<?php echo $class; ?>" style="min-height: 10px;">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 first-decision">
            <ul>
              <li class="title"><b>LojaVirtual</b> <span class="wca-font wca-amarela">Profissional</span></li>
              <li class="bullet-item">Sem limites de produtos</li>
              <li class="bullet-item">Loja com seu endereço na internet</li>
              <li class="bullet-item">Desenvolvimento completo</li>
              <li class="bullet-item">Manutenção de 3 meses</li>
              <li class="prices">
                <div class="price-inline">
                  <div class="pricetag">
                    <div class="price-before">12x de R$</div>
                    <div class="price-1">241</div>
                    <div class="right-box">
                      <div class="price-2">,58</div>
                      <div class="price-after">/mês</div>
                    </div>
                  </div>
                  <div class="button-more-info">
                    <a href="/profissional/" class="btn-wca">Saiba mais</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          
          
          <div class="col-lg-5 col-md-5 first-decision">
            <ul>
              <li class="title"><b>LojaVirtual</b> <span class="wca-font wca-amarela">Service</span></li>
              <li class="bullet-item">Sem limites de produtos</li>
              <li class="bullet-item">Loja com seu endereço na internet</li>
              <li class="bullet-item">Desenvolvimento completo</li>
              <li class="bullet-item">* Contrato/Manutenção de 1 ano</li>
              <li class="prices">
                <div class="price-inline">
                  <div class="pricetag">
                    <div class="price-before">R$</div>
                    <div class="price-1">299</div>
                    <div class="right-box">
                      <div class="price-2">,00*</div>
                      <div class="price-after">/mês</div>
                    </div>
                  </div>
                  <div class="button-more-info">
                    <a href="/service/" class="btn-wca">Saiba mais</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>
*/ ?>




<? /* ************************************************************************************
    O que é incluso
************************************************************************************* */ ?>

<a name="conheca"></a>
<div class="content content-incluso" style="padding-bottom: 60px;">
    <div class="container">
      <div class="row">

          <div class="col-lg-12" style="padding-top: 40px; color: #333; font-size: 32px;">
            <center><h2 style="font-size: 32px;">O que está <span class="wca-font wca-amarela" style="text-transform: none;">incluso</span> em nossas lojas</h2></center>
          </div>

          <div class="col-lg-12" style="padding: 20px;">
              <center><h2></h2></center>
          </div>
      </div>

      <div class="row advantages">
          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Produtos ILIMITADOS</b><br>com fácil gerenciamento</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Fotos ILIMITADAS</b><br>com zoom em todas as imagens</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Pageviews ILIMITADAS</b><br>com otmização de desempenho</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Banners editáveis</b><br>Para fácil atualização de sua loja</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Gerenciamento do menu de categoria</b><br>Permitindo escalabilidade</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Controle de estoque</b><br>Sistema de controle automático</h4>
          </div>
          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Produtos em oferta</b><br>Ex: Produto de <strike>R$ 100</strike> por R$ 95</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Cálculo de frete automático</b><br>Diretamente através dos correios</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Gerenciamento de vendas</b><br>Controle de seus pedidos com relatório</h4>
          </div>
          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Carrinho de compras</b><br>Fácil navegação com carrinho de compras</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Lista de desejos</b><br>Possibilidade de criação de listas</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Comparação de produtos</b><br>Interface para comprar produtos</h4>
          </div>
          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Cupons de desconto</b><br>Possibilidade de ofertas com cupons</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Vale presente</b><br>Antecipe as vendas com vale presente</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Comentários e avaliações</b><br>nas páginas de produto</h4>
          </div>
          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Atendimento via chat</b><br>Integrado com o Zopim.com</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Busca de produtos</b><br>Fácil localização de produtos</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/check.png" style="width: 50px; margin-top: 8px;"><h4 class="wcainclusotitulo"><b>Páginas de informações</b><br>com fácil edição via admin</h4>
          </div>
      </div>
    </div>
</div>








<? /* ************************************************************************************
    Centro de suporte
*************************************************************************************

<a name="conheca"></a>
<div class="content content-incluso" style="padding-bottom: 60px;">
    <div class="container">
      <div class="row">

          <div class="col-lg-12" style="padding-top: 40px; color: #333; font-size: 32px;">
            <center><h2 style="font-size: 32px;">Centro de Suporte - <span class="wca-font2" style="text-transform: uppercase; color: #757474;">LojaVirtual <span class="wca-font wca-amarela" style="text-transform: none;">.digital</span></h2></center>
          </div>

          <div class="col-lg-12" style="padding: 20px;">
              <center><h2></h2></center>
          </div>
      </div>

      <div class="row advantages">
          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/catalog/webca/icon-envio.png"><h4 class="wcainclusotitulo"><b>Vídeos de apoio</b><br> De acordo com o seu bolso</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/catalog/webca/icon-rescue.png"><h4 class="wcainclusotitulo"><b>Suporte e manutenção</b><br> Suporte técnico ao /admin via telefone</h4>
          </div>

          <div class="wcainclusoitem" data-toggle="tooltip-advantages" title="">
              <img src="/image/catalog/webca/icon-doc.png"><h4 class="wcainclusotitulo"><b>Documentação</b><br> Manual completo de uso do serviço</h4>
          </div>
      </div>
    </div>
</div>
*/ ?>




<? /* ************************************************************************************
    Produtos em Destaque e $CONTENT_TOP
************************************************************************************* */ ?>
<div class="container"> 
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
    </div>
  </div>
</div>


<? /* ************************************************************************************
    $content_bottom
************************************************************************************* */ ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <div id="content" class="<?php echo $class; ?>" style="min-height: 10px;">
        <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>

<script type="text/javascript" src="load/FWDSimple3DCoverflow.js"></script>
<script type="text/javascript" src="load/loadcover.js"></script>

<script src="/catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>

<style>
#owl-demo .item img{
    display: block;
    width: 100%;
    height: auto;
}
</style>


<script>
$(document).ready(function() {
  $("#owl-demo").owlCarousel({

  navigation : false,
  slideSpeed : 300,
  paginationSpeed : 400,
  singleItem : true,
  autoPlay : 5000

  // "singleItem:true" is a shortcut for:
  // items : 1, 
  // itemsDesktop : false,
  // itemsDesktopSmall : false,
  // itemsTablet: false,
  // itemsMobile : false

  });
});
</script>

<?php echo $footer; ?>