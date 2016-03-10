<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=1260">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="<?php echo $icon; ?>" rel="icon" />
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href='//fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Fjalla+One' rel='stylesheet' type='text/css'>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="/css-compress.php"/>

<?php /* css-compress.php -- <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" /> */ ?>

<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />

<?php /* css-compress.php -- <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet"> */ ?>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

<!-- Facebook Like box -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.5&appId=1427063280945050";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<!-- FIM Facebook Like box -->

<!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');
$.src='//v2.zopim.com/?2cQwfyblujZ70I5VuozVJQAV8RxfHpLn';z.t=+new Date;$.
type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
</script>
<!--End of Zopim Live Chat Script-->

<?php //echo $google_analytics; ?>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-57351164-1', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body class="<?php echo $class; ?>">

<style type="text/css">
  .promocao {
  position: fixed;
  bottom: 0px;
  width: 100%;
  background-color: red;
  z-index: 100;
  color: #FFFFFF;
  }
  .faceicon {
    font-size: 22px;
  }
  .fb-like {
    margin-right: 5px;
    margin-top: 13px;
    float: right;
  }
  .face-group {
    float: right;
    margin: 10px;
    color: #49649F;
  }
  .face-group:hover {
    color: #F6AE3B;
  }

  .telefonebox {
    background-color: #FCAD3A; 
    float: right;
    margin-top: -10px;
    margin-left: 20px;
    height: 45px;
    width: 200px;
    padding: 10px;
    border-bottom-left-radius: 4px;
    border-bottom-right-radius: 4px;
  }
  .telefonebox:hover {
    background-color: #757474;
  }
  .navitenscirc {
    float: left;
    background-color: #F6AE3B;
    width: 20px;
    height: 20px;
    text-align: center;
    border-radius: 50%;
    color: #FFF;
  }
  .nav>li>a:focus, .nav>li>a:hover {
    background-color: #fff;
  }
</style>

<?php /*
<div class="promocao">
  <div style="width: 1170px; padding: 30px; margin: auto;">
    <div style="font-size: 36px;">Atenção:</div>
    <div style="
    margin-top: 22px;
    font-size: 20px;
">Os valores ofertados em nosso site são válidos apenas para os orçamentos efetuados até 30/06/2015</div>
  </div>
</div>

*/ ?>

<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li>
          <a href="/painel" target="_blank" title="painel">
            <i class="fa fa-cog"></i> 
            <span class="hidden-xs hidden-sm hidden-md">Painel de Controle</span>
          </a>
        </li>
        <li>
          <a href="/webmail" target="_blank" title="webmail">
            <i class="fa fa-envelope"></i> 
            <span class="hidden-xs hidden-sm hidden-md">Webmail</span>
          </a>
        </li>
        
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>

        <li class="telefonebox"><i class="fa fa-phone" style="font-size: 24px; color: #FFF; margin-left: 8px;"></i>&nbsp;<span class="hidden-xs hidden-sm hidden-md" style="color: #ffffff; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); border-bottom-right-radius: 3px; border-bottom-left-radius: 3px; font-size: 24px;"><?php echo $telephone; ?></span></li>
      </ul>
    </div>
  </div>
</nav>

<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4" style="padding-right: 0px; padding-left: 0px;">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5" style="padding-right: 30px; margin-top: 10px;"><?php echo $search; ?>
      </div>
      <div class="col-sm-3" style="padding-left: 0px; margin-top: 10px; font-size: 14px;">
        <?php //echo $cart; ?>
        <a href="https://facebook.com/lojavirtual.digital" target="_blank">
        <div class="fb-like" data-href="https://facebook.com/lojavirtual.digital" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>

        <div class="face-group">
          <i class="fa fa-facebook faceicon"></i> 
          /lojavirtual.digital
        </div>
        </a>
      </div>

      <div class="container">
        <nav id="menu" class="navbar">
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
              <li><a href="/" class="select-home">Home</a></li>
              <li><a href="/modelos" class="select-modelos">Modelos</a></li>
              <li><a href="/profissional" class="select-lojavirtual">Loja Virtual</a></li>
              <li><a href="/plugins" class="select-plugins">Plugins</a></li>
              <li><a href="/email" class="select-email">E-Mail Corporativo</a></li>
            </ul>
          </div>
        </nav>
        
      </div>
    </div>
  </div>
</header>