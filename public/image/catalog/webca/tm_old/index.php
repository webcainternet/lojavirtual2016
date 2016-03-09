<?php
if ($handle = opendir('.')) {

    while (false !== ($entry = readdir($handle))) {

        if ($entry != "." && $entry != "..") {

            
?>

<div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      
      <div class="image">
      	<a href="http://lojavirtual.digital/mercadolivre">
      		<img src="http://lojavirtual.digital/image/catalog/webca/tm/<?php echo "$entry"; ?>" alt="Integração Mercado Livre" title="Integração Mercado Livre" class="img-responsive">
  		</a>
	  </div>

      <div class="caption">
        <h4><a href="http://lojavirtual.digital/mercadolivre">Modelo 54638</a></h4>
        <p class="price">R$ 645,00</p>
      </div>
      
      <div class="button-group">
        <a href="http://lojavirtual.digital/mercadolivre">
        	<button type="button" style="width: 100%;">
        		<i class="fa fa-shopping-cart-REMOVE"></i>
        		<span class="hidden-xs hidden-sm hidden-md">+ Ver demonstração</span>
    		</button>
		</a>
      </div>

    </div>
</div>

<?php
        }
    }

    closedir($handle);
}
?>