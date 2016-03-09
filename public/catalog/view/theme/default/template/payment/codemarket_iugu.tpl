<style type="text/css">

    .usable-creditcard-form .wrapper {
        border: 1px solid #CCC;
        border-top: 1px solid #AAA;
        border-right: 1px solid #AAA;
        height: 74px;
        width: 300px;
        position: relative;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        margin-left: 0px;
    }
    .usable-creditcard-form .input-group {
        position: absolute;
        top: 300px;
    }
    .usable-creditcard-form .input-group.nmb_a {
        position: absolute;
        width: 200px;
        top: 0px;
        left: 0px;
    }
    .usable-creditcard-form .input-group.nmb_b {
        position: absolute;
        width: 100px;
        top: 0px;
        right: 0px;
    }
    .usable-creditcard-form .input-group.nmb_b input,
    .usable-creditcard-form .input-group.nmb_d input {
        text-align: center;
    }
    .usable-creditcard-form .input-group.nmb_c {
        position: absolute;
        width: 200px;
        top: 37px;
        left: 0px;
    }
    .usable-creditcard-form .input-group.nmb_d {
        position: absolute;
        width: 100px;
        top: 37px;
        right: 0px;
    }
    .usable-creditcard-form input {
        background: none;
        display: block;
        width: 100%;
        padding: 10px;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        margin:0px;
        padding-left: 35px;
        border: none;
    }

    .usable-creditcard-form .input-group .icon {
        position: absolute;
        width: 22px;
        height: 22px;
        background: #CCC;
        left: 8px;
        top: 7px;
    }
    .usable-creditcard-form .input-group.nmb_a input {
        border-right: 1px solid #ECECEC;
    }
    .usable-creditcard-form .input-group.nmb_c input {
        border-top: 1px solid #ECECEC;
        border-right: 1px solid #ECECEC;
    }

    .usable-creditcard-form input::-webkit-input-placeholder {
        font-size: 14px;
        text-transform: none;
    }
    .usable-creditcard-form .input-group.nmb_d input {
        border-top: 1px solid #ECECEC;
    }

    .usable-creditcard-form .input-group.nmb_c input {
        text-transform: uppercase;
    }
    .usable-creditcard-form .accept {
        color: #999;
        font-size: 14px;
        margin-bottom: 5px;
    }
    .footer_img  {
        margin-top: 10px;
        margin-bottom: 10px;
        position: relative;
        margin-left: 5px;
        margin-right: 5px;
    }

    .footer_img img {
        padding: 0px;
        margin: 0px;
    }
    .usable-creditcard-form .iugu-btn {
        position: absolute;
        top: 0px;
        right: 0px;
    }

    /* Do not forget to store your images in a secure server */
    .usable-creditcard-form .input-group .icon.ccic-name {
        background: url("image/iugu/1.png") no-repeat;
    }
    .usable-creditcard-form .input-group .icon.ccic-exp {
        background: url("image/iugu/2.png") no-repeat;
    }
    .usable-creditcard-form .input-group .icon.ccic-brand {
        background: url("image/iugu/3.png") no-repeat;
    }
    .usable-creditcard-form .input-group .icon.ccic-cvv { background: url("image/iugu/4.png") no-repeat; }

    .usable-creditcard-form .input-group .icon.ccic-cvv,
    .usable-creditcard-form .input-group .icon.ccic-brand
    {
        -webkit-transition:background-position .2s ease-in;
        -moz-transition:background-position .2s ease-in;
        -o-transition:background-position .2s ease-in;
        transition:background-position .2s ease-in;
    }

    .amex .usable-creditcard-form .input-group .icon.ccic-cvv {
        background-position: 0px -22px;
    }

    .amex .usable-creditcard-form .input-group .icon.ccic-brand {
        background-position: 0px -110px;
    }

    .visa .usable-creditcard-form .input-group .icon.ccic-brand {
        background-position: 0px -22px;
    }

    .diners .usable-creditcard-form .input-group .icon.ccic-brand {
        background-position: 0px -88px;
    }

    .mastercard .usable-creditcard-form .input-group .icon.ccic-brand {
        background-position: 0px -66px;
    }

    #desconto_boleto {
        font-size: 16px;
        margin-bottom: 8px;
    }

    * {
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }
    
    #aviso_cartao {
        margin-top: 10px;
        margin-bottom: 10px;
        width: 300px;
    }
    
    .bg-info{
        padding: 20px;
    }
    
    .green{
        color:green;
    }
    
    .parcela{
        width:300px; 
        margin-top: 10px;
    }
    
    #cpf{
        width:300px !important; 
        border: 1px solid #CCCCCC !important;
    }
</style>
<div class="container-fluid">
    <div id="aviso_pagamento"></div>
    <div class="row">
        <?php if (($conf->iugu_cartao == 1) and ($conf->iugu_minimo_cartao < $total) and ( $conf->iugu_maximo_cartao > $total)) {?>
        <div class="col-xs-6 col-md-6 col-sm-12"><form id="payment-form"  action="" method="POST">
                <?php if(!empty($cartao_salvo)) { ?>
                <div id='cartao_novo' style="display:none;">
                <?php }else { ?>
                    <div id='cartao_novo'>
                <?php } ?>
                    <div class="usable-creditcard-form">
                        <h3><?php echo $text_cartao; ?></h3>
                        <div class="wrapper">
                            <div class="input-group nmb_a">
                                <div class="icon ccic-brand"></div>
                                <input autocomplete="off" class="credit_card_number" data-iugu="number" placeholder="Número do Cartão" type="text" value="" />
                            </div>
                            <div class="input-group nmb_b">
                                <div class="icon ccic-cvv"></div>
                                <input autocomplete="off" class="credit_card_cvv" data-iugu="verification_value" placeholder="CVV" type="text" value="" />
                            </div>
                            <div class="input-group nmb_c">
                                <div class="icon ccic-name"></div>
                                <input class="credit_card_name" data-iugu="full_name" placeholder="Titular do Cartão" type="text" value="" />
                            </div>
                            <div class="input-group nmb_d">
                                <div class="icon ccic-exp"></div>
                                <input autocomplete="off" class="credit_card_expiration" data-iugu="expiration" placeholder="MM/AA" type="text" value="" />
                            </div>
                        </div>
                                                <div id="aviso_cartao"></div>

                        <?php echo $cartao; ?>
                         <br><div class="form-group required "><label class="control-label">Confirmar CPF ou CNPJ do Títular do Cartão</label>
                            <input class ="form-control " id="cpf" name="cpf_iugu" placeholder="Informe o CPF ou CNPJ do Títular" type="text" value="<?php if(!empty($cpf)) echo $cpf; ?>" required />
                             </div>
                        <div class="footer_img">
                            <img src="image/iugu/iugu_bandeiras.png" alt="Visa, Master, Diners. Amex" border="0" />
                        </div>
                    </div>
                    <input type="hidden" name="token" id="token" value="" readonly="true" size="64"/>
                    <?php if($salvar_cartao == 1) {
                    echo " <div class='checkbox'>
    <label> <input type='checkbox' name='salvar_cartao' value='1' checked>$text_salvar_dados </label></div>";
                    } ?>
                     <?php if(!empty($cartao_salvo)) { ?> <input id="novo_cartao1" type='checkbox' value='1'><?php echo $text_utilizar_cartao."<br>"; } ?>
                    <a id="button-confirm" class="btn btn-success btn-lg" data-loading-text="<?php echo $text_wait; ?>"><span><?php echo $button_confirm; ?></span></a>
                </div>
            </form>
                <?php if(!empty($cartao_salvo)) { ?>
                    <form id="payment-form-salvo"  action="" method="POST">
                <div id='cartao_salvo'>
                    <?php $dados = (array)($cartao_salvo['data']); ?>
                    <div class="usable-creditcard-form">
                        <div id='cartao'><?php echo $text_cartao; ?></div>
                        <div class="wrapper">
                            <div class="input-group nmb_a">
                                <div class="icon ccic-brand"></div>
                                <input autocomplete="off" class="credit_card_number" type="text" value="<?php echo $dados['display_number'] ?>"  readonly/>
                            </div>
                            <div class="input-group nmb_b">
                                <div class="icon ccic-cvv"></div>
                                <input autocomplete="off" class="credit_card_cvv" type="text" value="XXX"  readonly/>
                            </div>
                            <div class="input-group nmb_c">
                                <div class="icon ccic-name"></div>
                                <input class="credit_card_name" type="text" value="<?php echo $dados['holder_name'] ?>"  readonly/>
                            </div>
                            <div class="input-group nmb_d">
                                <div class="icon ccic-exp"></div>
                                <input autocomplete="off" class="credit_card_expiration" type="text" value="XX/XX"  readonly/>
                            </div>
                        </div>
                                                <div id="aviso_cartao"></div>

                        <?php echo $cartao; ?>
                        <br><div class="form-group required "><label class="control-label">Confirmar CPF ou CNPJ do Títular do Cartão</label>
                            <input class ="form-control " id="cpf" name="cpf_iugu" placeholder="Informe o CPF ou CNPJ do Títular" type="text" value="<?php if(!empty($cpf)) echo $cpf; ?>" required />
                             </div>
                        <div class="footer_img">
                            <img src="image/iugu/iugu_bandeiras.png" alt="Visa, Master, Diners. Amex" border="0" />
                        </div>
                    </div>
                    <input type="hidden" name="id" value="<?php echo $cartao_salvo['id']?>" readonly="true" size="64"/>
                    <input id="novo_cartao" type='checkbox' value='1'><?php echo $text_novo_cartao; ?>
                    <br>
                    <a id="button-confirm_cartao_salvo" class="btn btn-success btn-lg" data-loading-text="<?php echo $text_wait; ?>"><span><?php echo $button_confirm; ?></span></a>
                </div>
            </form>
                <?php } ?>
        </div>
        <?php }  if (($conf->iugu_boleto == 1) and ($conf->iugu_minimo_boleto < $total) and ( $conf->iugu_maximo_boleto > $total)) { ?>
        <div class="col-xs-4 col-md-4 col-sm-12">
            <h3><?php echo $text_boleto; ?></h3>
            <div class="footer_img">
                <img src="image/iugu/boleto.png" alt="Boleto" border="0" />
            </div>

            <?php if (!empty($desconto_boleto)){ ?>
            <div id="desconto_boleto">
            <b  style="color: rgb(0, 193, 0);">Desconto de R$ <?php echo $desconto_boleto; ?></b>
            <br><b>Sub-total:</b> R$ <?php echo $desconto_boleto_subtotal; ?>
            <br><span style="font-size:14px;"><b>Total:</b> R$ <?php echo $desconto_boleto_total; ?></span>
            </div>
            <?php } ?>
           <a id="button-confirm_boleto" class="btn btn-success btn-lg" data-loading-text="<?php echo $text_wait; ?>"><span><?php echo $button_confirm_boleto; ?></span></a
        </div>
        <?php } ?>
    </div>
</div>
</div>
<script type="text/javascript"><!--
    $("#novo_cartao").click(function(){
            if ($(this).is(":checked")) {
        $('#cartao_salvo').hide();
        $('#cartao_novo').show();
        $("#novo_cartao1").attr("checked",false);

    } else {
        $('#cartao_novo').hide();
        $('#cartao_salvo').show();
    }
    });

    $("#novo_cartao1").click(function(){
            if ($(this).is(":checked")) {
       $('#cartao_novo').hide();
        $('#cartao_salvo').show();
        $("#novo_cartao").attr("checked",false);
    }
    });
    $('#button-confirm_boleto').bind('click', function() {
        $("#button-confirm_boleto").button('loading');
        $.ajax({
        type: 'GET',
                contentType :'application/x-www-form-urlencoded; charset=utf-8',
                dataType: 'text',
                timeout: 35000,
                url: 'index.php?route=payment/codemarket_iugu/confirm',
                success: function(data) {
                if (data == 5) {
                    $("#aviso_pagamento").html("<?php echo $text_erro_pagamento; ?>");
                     $("#button-confirm_boleto").button('reset');
                    //console.log('Pagamento por Boleto Falhou ' + data);
                } else {
                window.location = data;
                // console.log('Pagamento por Boleto ' + data);
                }
                },
                error: function(){
                    $("#aviso_pagamento").html("<?php echo $text_erro_pagamento; ?>");
                    $("#button-confirm_boleto").button('reset');
                }
        });
    });

    $('#button-confirm_cartao_salvo').bind('click', function() {
        $("#button-confirm_cartao_salvo").button('loading');
              $.ajax({
                type: 'POST',
                contentType :'application/x-www-form-urlencoded; charset=utf-8',
                dataType: 'text',
                timeout: 35000,
                url: 'index.php?route=payment/codemarket_iugu/confirm',
                data: $('#payment-form-salvo').serialize()+ '&' + $.param({'usar_cartao_salvo' : 1}),
                success: function(data) {
                  if (data == 6) {
                    $("#aviso_pagamento").html("<div class='alert alert-warning'>Informe o CPF ou CNPJ válido do Titular do Cartão! <button type='button' class='close' data-dismiss='alert'>×</button></div>");
                    $("#button-confirm_cartao_salvo").button('reset');
                } else if (data == 5) {
                    $("#aviso_pagamento").html("<?php echo $text_erro_pagamento; ?>");
                     $("#button-confirm_cartao_salvo").button('reset');
                } else {
                  window.location = data;
                 //console.log('Pagamento por Cartão' + data);
                }
                },
                error: function(){
                    $("#aviso_pagamento").html("<?php echo $text_erro_pagamento; ?>");
                    $("#button-confirm_cartao_salvo").button('reset');
                }
        });
    });
    $('#button-confirm').bind('click', function() {
        $("#payment-form").submit();
    });
//--></script>
<script type="text/javascript" src="https://js.iugu.com/v2"></script>
<script type="text/javascript">
           !function(a, b){"function"==typeof define&&define.amd?define([],function(){return a.returnExportsGlobal=b()}):"object"==typeof exports?module.exports=b():a.Formatter=b()}(this, function(){var a=function(){var a={},b=4,c=new RegExp("{{([^}]+)}}","g"),d=function(a){for(var b,d=[];b=c.exec(a);)d.push(b);return d};return a.parse=function(a){var c={inpts:{},chars:{}},e=d(a),f=a.length,g=0,h=0,i=0,j=function(a){for(var d=a.length,e=0;d>e;e++)c.inpts[h]=a.charAt(e),h++;g++,i+=a.length+b-1};for(i;f>i;i++)g<e.length&&i===e[g].index?j(e[g][1]):c.chars[i-g*b]=a.charAt(i);return c.mLength=i-g*b,c},a}(),b=function(){{var a={};"undefined"!=typeof navigator?navigator.userAgent:null}return a.extend=function(a){for(var b=1;b<arguments.length;b++)for(var c in arguments[b])a[c]=arguments[b][c];return a},a.addChars=function(a,b,c){return a.substr(0,c)+b+a.substr(c,a.length)},a.removeChars=function(a,b,c){return a.substr(0,b)+a.substr(c,a.length)},a.isBetween=function(a,b){return b.sort(function(a,b){return a-b}),a>b[0]&&a<b[1]},a.addListener=function(a,b,c){return"undefined"!=typeof a.addEventListener?a.addEventListener(b,c,!1):a.attachEvent("on"+b,c)},a.preventDefault=function(a){return a.preventDefault?a.preventDefault():a.returnValue=!1},a.getClip=function(a){return a.clipboardData?a.clipboardData.getData("Text"):window.clipboardData?window.clipboardData.getData("Text"):void 0},a.getMatchingKey=function(a,b,c){for(var d in c){var e=c[d];if(a===e.which&&b===e.keyCode)return d}},a.isDelKeyDown=function(b,c){var d={backspace:{which:8,keyCode:8},"delete":{which:46,keyCode:46}};return a.getMatchingKey(b,c,d)},a.isDelKeyPress=function(b,c){var d={backspace:{which:8,keyCode:8,shiftKey:!1},"delete":{which:0,keyCode:46}};return a.getMatchingKey(b,c,d)},a.isSpecialKeyPress=function(b,c){var d={tab:{which:0,keyCode:9},enter:{which:13,keyCode:13},end:{which:0,keyCode:35},home:{which:0,keyCode:36},leftarrow:{which:0,keyCode:37},uparrow:{which:0,keyCode:38},rightarrow:{which:0,keyCode:39},downarrow:{which:0,keyCode:40},F5:{which:116,keyCode:116}};return a.getMatchingKey(b,c,d)},a.isModifier=function(a){return a.ctrlKey||a.altKey||a.metaKey},a.forEach=function(a,b,c){if(a.hasOwnProperty("length"))for(var d=0,e=a.length;e>d&&b.call(c,a[d],d,a)!==!1;d++);else for(var f in a)if(a.hasOwnProperty(f)&&b.call(c,a[f],f,a)===!1)break},a}(),c=function(a,b){function c(c){var e=[],f=[];b.forEach(c,function(c){b.forEach(c,function(b,c){var g=a.parse(b),h=d(c);return e.push(h),f.push(g),!1})});var g=function(a){var c;return b.forEach(e,function(b,d){return b.test(a)?(c=d,!1):void 0}),void 0===c?null:f[c]};return{getPattern:g,patterns:f,matchers:e}}var d=function(a){return"*"===a?/.*/:new RegExp(a)};return c}(a,b),d=function(){var a={};return a.get=function(a){if("number"==typeof a.selectionStart)return{begin:a.selectionStart,end:a.selectionEnd};var b=document.selection.createRange();if(b&&b.parentElement()===a){var c=a.createTextRange(),d=a.createTextRange(),e=a.value.length;return c.moveToBookmark(b.getBookmark()),d.collapse(!1),c.compareEndPoints("StartToEnd",d)>-1?{begin:e,end:e}:{begin:-c.moveStart("character",-e),end:-c.moveEnd("character",-e)}}return{begin:0,end:0}},a.set=function(a,b){if("object"!=typeof b&&(b={begin:b,end:b}),a.setSelectionRange)a.focus(),a.setSelectionRange(b.begin,b.end);else if(a.createTextRange){var c=a.createTextRange();c.collapse(!0),c.moveEnd("character",b.end),c.moveStart("character",b.begin),c.select()}},a}(),e=function(a,b,c){function d(b,d){var f=this;if(f.el=b,!f.el)throw new TypeError("Must provide an existing element");if(f.opts=c.extend({},e,d),"undefined"!=typeof f.opts.pattern&&(f.opts.patterns=f._specFromSinglePattern(f.opts.pattern),delete f.opts.pattern),"undefined"==typeof f.opts.patterns)throw new TypeError("Must provide a pattern or array of patterns");f.patternMatcher=a(f.opts.patterns),f._updatePattern(),f.hldrs={},f.focus=0,c.addListener(f.el,"keydown",function(a){f._keyDown(a)}),c.addListener(f.el,"keypress",function(a){f._keyPress(a)}),c.addListener(f.el,"paste",function(a){f._paste(a)}),f.opts.persistent&&(f._processKey("",!1),f.el.blur(),c.addListener(f.el,"focus",function(a){f._focus(a)}),c.addListener(f.el,"click",function(a){f._focus(a)}),c.addListener(f.el,"touchstart",function(a){f._focus(a)}))}var e={persistent:!1,repeat:!1,placeholder:" "},f={9:/[0-9]/,a:/[A-Za-z]/,"*":/[A-Za-z0-9]/};return d.addInptType=function(a,b){f[a]=b},d.prototype.resetPattern=function(c){this.opts.patterns=c?this._specFromSinglePattern(c):this.opts.patterns,this.sel=b.get(this.el),this.val=this.el.value,this.delta=0,this._removeChars(),this.patternMatcher=a(this.opts.patterns);var d=this.patternMatcher.getPattern(this.val);this.mLength=d.mLength,this.chars=d.chars,this.inpts=d.inpts,this._processKey("",!1,!0)},d.prototype._updatePattern=function(){var a=this.patternMatcher.getPattern(this.val);a&&(this.mLength=a.mLength,this.chars=a.chars,this.inpts=a.inpts)},d.prototype._keyDown=function(a){var b=a.which||a.keyCode;return b&&c.isDelKeyDown(a.which,a.keyCode)?(this._processKey(null,b),c.preventDefault(a)):void 0},d.prototype._keyPress=function(a){var b,d;return b=a.which||a.keyCode,d=c.isSpecialKeyPress(a.which,a.keyCode),c.isDelKeyPress(a.which,a.keyCode)||d||c.isModifier(a)?void 0:(this._processKey(String.fromCharCode(b),!1),c.preventDefault(a))},d.prototype._paste=function(a){return this._processKey(c.getClip(a),!1),c.preventDefault(a)},d.prototype._focus=function(){var a=this;setTimeout(function(){var c=b.get(a.el),d=c.end>a.focus,e=0===c.end;(d||e)&&b.set(a.el,a.focus)},0)},d.prototype._processKey=function(a,d,e){if(this.sel=b.get(this.el),this.val=this.el.value,this.delta=0,this.sel.begin!==this.sel.end)this.delta=-1*Math.abs(this.sel.begin-this.sel.end),this.val=c.removeChars(this.val,this.sel.begin,this.sel.end);else if(d&&46===d)this._delete();else if(d&&this.sel.begin-1>=0)this.val=c.removeChars(this.val,this.sel.end-1,this.sel.end),this.delta-=1;else if(d)return!0;d||(this.val=c.addChars(this.val,a,this.sel.begin),this.delta+=a.length),this._formatValue(e)},d.prototype._delete=function(){for(;this.chars[this.sel.begin];)this._nextPos();this.sel.begin<this.val.length&&(this._nextPos(),this.val=c.removeChars(this.val,this.sel.end-1,this.sel.end),this.delta=-1)},d.prototype._nextPos=function(){this.sel.end++,this.sel.begin++},d.prototype._formatValue=function(a){this.newPos=this.sel.end+this.delta,this._removeChars(),this._updatePattern(),this._validateInpts(),this._addChars(),this.el.value=this.val.substr(0,this.mLength),("undefined"==typeof a||a===!1)&&b.set(this.el,this.newPos)},d.prototype._removeChars=function(){this.sel.end>this.focus&&(this.delta+=this.sel.end-this.focus);for(var a=0,b=0;b<=this.mLength;b++){var d,e=this.chars[b],f=this.hldrs[b],g=b+a;g=b>=this.sel.begin?g+this.delta:g,d=this.val.charAt(g),(e&&e===d||f&&f===d)&&(this.val=c.removeChars(this.val,g,g+1),a--)}this.hldrs={},this.focus=this.val.length},d.prototype._validateInpts=function(){for(var a=0;a<this.val.length;a++){var b=this.inpts[a],d=!f[b],e=!d&&!f[b].test(this.val.charAt(a)),g=this.inpts[a];(d||e)&&g&&(this.val=c.removeChars(this.val,a,a+1),this.focusStart--,this.newPos--,this.delta--,a--)}},d.prototype._addChars=function(){if(this.opts.persistent){for(var a=0;a<=this.mLength;a++)this.val.charAt(a)||(this.val=c.addChars(this.val,this.opts.placeholder,a),this.hldrs[a]=this.opts.placeholder),this._addChar(a);for(;this.chars[this.focus];)this.focus++}else for(var b=0;b<=this.val.length;b++){if(this.delta<=0&&b===this.focus)return!0;this._addChar(b)}},d.prototype._addChar=function(a){var b=this.chars[a];return b?(c.isBetween(a,[this.sel.begin-1,this.newPos+1])&&(this.newPos++,this.delta++),a<=this.focus&&this.focus++,this.hldrs[a]&&(delete this.hldrs[a],this.hldrs[a+1]=this.opts.placeholder),void(this.val=c.addChars(this.val,b,a))):!0},d.prototype._specFromSinglePattern=function(a){return[{"*":a}]},d}(c,d,b);return e}
            );

 /*
    jQuery Masked Input Plugin
    Copyright (c) 2007 - 2014 Josh Bush (digitalbush.com)
    Licensed under the MIT license (http://digitalbush.com/projects/masked-input-plugin/#license)
    Version: 1.4.0
*/
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a("object"==typeof exports?require("jquery"):jQuery)}(function(a){var b,c=navigator.userAgent,d=/iphone/i.test(c),e=/chrome/i.test(c),f=/android/i.test(c);a.mask={definitions:{9:"[0-9]",a:"[A-Za-z]","*":"[A-Za-z0-9]"},autoclear:!0,dataName:"rawMaskFn",placeholder:"_"},a.fn.extend({caret:function(a,b){var c;if(0!==this.length&&!this.is(":hidden"))return"number"==typeof a?(b="number"==typeof b?b:a,this.each(function(){this.setSelectionRange?this.setSelectionRange(a,b):this.createTextRange&&(c=this.createTextRange(),c.collapse(!0),c.moveEnd("character",b),c.moveStart("character",a),c.select())})):(this[0].setSelectionRange?(a=this[0].selectionStart,b=this[0].selectionEnd):document.selection&&document.selection.createRange&&(c=document.selection.createRange(),a=0-c.duplicate().moveStart("character",-1e5),b=a+c.text.length),{begin:a,end:b})},unmask:function(){return this.trigger("unmask")},mask:function(c,g){var h,i,j,k,l,m,n,o;if(!c&&this.length>0){h=a(this[0]);var p=h.data(a.mask.dataName);return p?p():void 0}return g=a.extend({autoclear:a.mask.autoclear,placeholder:a.mask.placeholder,completed:null},g),i=a.mask.definitions,j=[],k=n=c.length,l=null,a.each(c.split(""),function(a,b){"?"==b?(n--,k=a):i[b]?(j.push(new RegExp(i[b])),null===l&&(l=j.length-1),k>a&&(m=j.length-1)):j.push(null)}),this.trigger("unmask").each(function(){function h(){if(g.completed){for(var a=l;m>=a;a++)if(j[a]&&C[a]===p(a))return;g.completed.call(B)}}function p(a){return g.placeholder.charAt(a<g.placeholder.length?a:0)}function q(a){for(;++a<n&&!j[a];);return a}function r(a){for(;--a>=0&&!j[a];);return a}function s(a,b){var c,d;if(!(0>a)){for(c=a,d=q(b);n>c;c++)if(j[c]){if(!(n>d&&j[c].test(C[d])))break;C[c]=C[d],C[d]=p(d),d=q(d)}z(),B.caret(Math.max(l,a))}}function t(a){var b,c,d,e;for(b=a,c=p(a);n>b;b++)if(j[b]){if(d=q(b),e=C[b],C[b]=c,!(n>d&&j[d].test(e)))break;c=e}}function u(){var a=B.val(),b=B.caret();if(a.length<o.length){for(A(!0);b.begin>0&&!j[b.begin-1];)b.begin--;if(0===b.begin)for(;b.begin<l&&!j[b.begin];)b.begin++;B.caret(b.begin,b.begin)}else{for(A(!0);b.begin<n&&!j[b.begin];)b.begin++;B.caret(b.begin,b.begin)}h()}function v(){A(),B.val()!=E&&B.change()}function w(a){if(!B.prop("readonly")){var b,c,e,f=a.which||a.keyCode;o=B.val(),8===f||46===f||d&&127===f?(b=B.caret(),c=b.begin,e=b.end,e-c===0&&(c=46!==f?r(c):e=q(c-1),e=46===f?q(e):e),y(c,e),s(c,e-1),a.preventDefault()):13===f?v.call(this,a):27===f&&(B.val(E),B.caret(0,A()),a.preventDefault())}}function x(b){if(!B.prop("readonly")){var c,d,e,g=b.which||b.keyCode,i=B.caret();if(!(b.ctrlKey||b.altKey||b.metaKey||32>g)&&g&&13!==g){if(i.end-i.begin!==0&&(y(i.begin,i.end),s(i.begin,i.end-1)),c=q(i.begin-1),n>c&&(d=String.fromCharCode(g),j[c].test(d))){if(t(c),C[c]=d,z(),e=q(c),f){var k=function(){a.proxy(a.fn.caret,B,e)()};setTimeout(k,0)}else B.caret(e);i.begin<=m&&h()}b.preventDefault()}}}function y(a,b){var c;for(c=a;b>c&&n>c;c++)j[c]&&(C[c]=p(c))}function z(){B.val(C.join(""))}function A(a){var b,c,d,e=B.val(),f=-1;for(b=0,d=0;n>b;b++)if(j[b]){for(C[b]=p(b);d++<e.length;)if(c=e.charAt(d-1),j[b].test(c)){C[b]=c,f=b;break}if(d>e.length){y(b+1,n);break}}else C[b]===e.charAt(d)&&d++,k>b&&(f=b);return a?z():k>f+1?g.autoclear||C.join("")===D?(B.val()&&B.val(""),y(0,n)):z():(z(),B.val(B.val().substring(0,f+1))),k?b:l}var B=a(this),C=a.map(c.split(""),function(a,b){return"?"!=a?i[a]?p(b):a:void 0}),D=C.join(""),E=B.val();B.data(a.mask.dataName,function(){return a.map(C,function(a,b){return j[b]&&a!=p(b)?a:null}).join("")}),B.one("unmask",function(){B.off(".mask").removeData(a.mask.dataName)}).on("focus.mask",function(){if(!B.prop("readonly")){clearTimeout(b);var a;E=B.val(),a=A(),b=setTimeout(function(){z(),a==c.replace("?","").length?B.caret(0,a):B.caret(a)},10)}}).on("blur.mask",v).on("keydown.mask",w).on("keypress.mask",x).on("input.mask paste.mask",function(){B.prop("readonly")||setTimeout(function(){var a=A(!0);B.caret(a),h()},0)}),e&&f&&B.off("input.mask").on("input.mask",u),A()})}})});
if($("#cpf").length > 0) $("#cpf").mask("99999999999?999");
</script>
<script>
                    jQuery(function($) {

                            $('.ccic-cvv').hover(
                                function () {
                                  $("#aviso_cartao").html("<?php echo $text_cvv; ?>");
                                },
                                function () {
                                   $("#aviso_cartao").html("");
                                }
                            );

                            $('#payment-form').submit(function(evt) {
                            Iugu.setAccountID("<?php echo $conf->iugu_id; ?>");
                            Iugu.setTestMode(<?php if ($conf->iugu_teste == 1) { echo 'true'; } else{ echo 'false'; }?>);
                            var form = $(this);
                            var tokenResponseHandler = function(data) {
                            if (data.errors) {
                                //console.log(data.errors);
                                $("#aviso_cartao").html("<?php echo $text_cartao_invalido; ?>");
                            } else {
                            $("#token").val(data.id);
                                $("#button-confirm").button('loading');
                                    $.ajax({
                                    'type': 'POST',
                                            contentType :'application/x-www-form-urlencoded; charset=utf-8',
                                            dataType: 'text',
                                            timeout: 35000,
                                            url: 'index.php?route=payment/codemarket_iugu/confirm',
                                            data: $('#payment-form').serialize()+ '&' + $.param({'novo_cartao' : 1}),
                                            success: function(data) {
                                            if (data == 6) {
                                                $("#aviso_pagamento").html("<div class='alert alert-warning'>Informe o CPF ou CNPJ válido do Titular do Cartão<button type='button' class='close' data-dismiss='alert'>×</button></div>");
                                                $("#button-confirm").button('reset');
                                            }
                                            else if (data ==  5) {
                                                $("#aviso_pagamento").html("<?php echo $text_erro_pagamento; ?>");
                                                $("#button-confirm").button('reset');
                                            } else {
                                              window.location = data;
                                            //console.log('Pagamento por Cartão ' + data);
                                            }
                                            },
                                            error: function(){
                                                $("#aviso_pagamento").html("<?php echo $text_erro_pagamento; ?>");
                                                $("#button-confirm").button('reset');
                                            }
                                    });
                            }
                            }
                    Iugu.createPaymentToken(this, tokenResponseHandler);
                            return false;
                    });
                    });
</script>