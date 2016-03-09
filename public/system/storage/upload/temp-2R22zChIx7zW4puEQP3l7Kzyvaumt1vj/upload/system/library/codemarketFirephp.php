<?php
ob_start();
require_once(DIR_SYSTEM . 'library/FirePHPCore/FirePHP.class.php');
class CodemarketFirephp {
    
   public static function log($metodo, $dev = true){
        $log = FirePHP::getInstance($dev);
        $log->setEnabled($dev);
       
        $log->group('Método '.$metodo);
        $log->log('Dentro do '.$metodo.'()');
        if(!empty($_POST)){
            $log->log($_POST, 'POST');
        }
        if(!empty($_GET)){
            $log->log($_GET, 'GET');
        }
        if(!empty($_SESSION)){
            $log->log($_SESSION, 'SESSION');
        }
        if(!empty($_COOKIE)){
            $log->log($_COOKIE, 'COOKIE');
        }
        if(!empty($_SERVER)){
            $log->log($_SERVER, 'SERVER');
        } 
        return $log;
    }
}