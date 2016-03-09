<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      
<style>
.c {
  text-align: center;
}

.red{
    color: #EC4242;
}

.bar {
  width:425px;
}
</style>

                <?php if(!empty($code_boleto)){
                $boleto = $code_boleto;
                $barcodel = $boleto['barcodel'];
                $barcode = $boleto['barcode'];
                $link = $boleto['link'];
                $total = $boleto['total']; ?>
                <h1 class="text-success">Pedido criado com sucesso</h1>
                <h3 class="red">Pague o Boleto para confirmar o Pagamento e o Pedido</h3>
                <div class="bar">
                  <h3 class="c">Use este código de barras para pagamentos no bankline</h3>
                  <h5 class="c"><?php echo $barcodel; ?></h5>
                  <img src="<?php echo $barcode; ?>">
                </div>
               <?php echo $link; ?>
                <br><br>
                <?php 
            } elseif(!empty($cartao_iugu['cartao'])){
                if($cartao_iugu['duas_etapas'] == 1) { 
            ?>
                <h1 class="text-success"> Pagamento por Cartão de Crédito criado com sucesso</h1> 
                <h3>Verifique em Pedidos ou Aguarde um e-mail informando a confirmação do pagamento</h3>
            <?php
            }else { ?>
                <h1 class="text-success"> Pagamento por Cartão de Crédito confirmado com sucesso</h1> 
                <h3>Seu Pedido foi aprovado com sucesso</h3>
            <?php
                }
                } else { ?>    
                    <h1><?php echo $heading_title; ?></h1>
                <?php } ?>  
            
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>