<?php 
	$tmid = $_GET['tmid'];
?>

<html>

<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<title>Loja Virtual .digital - Demonstração</title>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-57351164-1', 'auto');
  ga('send', 'pageview');

</script>
</head>

<frameset rows="*,100" frameborder="0">
  <frame src="http://livedemo00.template-help.com/opencart_<?php echo $tmid; ?>">
  <frame src="header.php?tmid=<?php echo $tmid; ?>"  noresize="noresize" scrolling="no">
</frameset>

</html>
