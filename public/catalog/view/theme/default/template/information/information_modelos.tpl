<style type="text/css">
  .select-modelos {
    border-bottom: solid 2px #FCAD3A !important;
    color: #FCAD3A !important;
  }
    .image-additional {
        max-width: 365px;
    }
    .image-texto {
        text-align: center;
        padding: 5px;
        display: none;
    }
    .image-texto-demo {
        text-align: center;
        padding: 5px;
        background-color: #eee;
        width: 140px;
        margin: auto;
        margin-top: 5px;
        border-radius: 5px;
        font-size: 10px;
        border: solid 1px;
        font-weight: bold;
        text-transform: uppercase;
        }
    h4 {
        color: #f6ae3b;
        font-weight: bold;
    }
    h4:hover {
        color: #2a6496;
    }
    button {
        width: 100%;
        border: none;
        display: inline-block;
        background-color: #eee;
        color: #888;
        line-height: 38px;
        font-weight: bold;
        text-align: center;
        text-transform: uppercase;
    }
    button:hover {
    color: #444;
    background-color: #ddd;
    text-decoration: none;
    cursor: pointer;
}
</style>

<ul class="thumbnails">
<?php

if ($handle = opendir('/srv/httpd/lojavirtual.digital/public/image/catalog/webca/tm/')) {
    $ci = 0;
    while (false !== ($entry = readdir($handle))) {

        if ($entry != "." && $entry != "..") {

            $arr[$ci] = '<li class="image-additional"><a class="thumbnail" href="http://demo.lojavirtual.digital/demo/?tmid='.substr($entry, 0, 5).'/" target="_blank" title="Modelo - '.$entry.'"><div class="image-texto" style="background-color: #f6ae32; color: #111;">Modelo - '.substr($entry, 0, 5).'</div><img src="//lojavirtual.digital/image/catalog/webca/tm/'.$entry.'" title="Modelo - '.substr($entry, 0, 5).'" alt="Modelo - '.substr($entry, 0, 5).'"><h4>Modelo - '.substr($entry, 0, 5).'</h4><button type="button" style="width: 100%;"><i class="fa fa-shopping-cart-REMOVE"></i> <span class="hidden-xs hidden-sm hidden-md">+ Saiba Mais</span></button></a></li>';

            $ci++;
        }
    }

    $arr = arsort($arr);
    //$arr = array_reverse($arr);
    while (list ($key, $val) = each ($arr) ) echo $val; 

    closedir($handle);
}
?>