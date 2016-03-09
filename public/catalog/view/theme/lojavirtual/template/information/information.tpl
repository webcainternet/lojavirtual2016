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
    
      <?php
        switch ($heading_title) {
          case "Modelos":
              include "information_modelos.tpl";
              break;
          case "Demonstração":
              include "information_demonstracao.tpl";
              break;
          case "Contato efetuado!":
              echo "<h1>".$heading_title."</h1>";
              echo $description;
              include "information_contatoefetuado.tpl";
              break;
          default:
              echo "<h1>".$heading_title."</h1>";
              echo $description;
              break;
        }
      ?>

      <?php echo $content_bottom; ?></div>
      <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 