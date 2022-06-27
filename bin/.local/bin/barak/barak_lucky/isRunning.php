<?php

shell_exec("bash check.sh");
$response=shell_exec('read response<respnsefifo;echo $response');

if (strpos($response, 'isRunning=true') !== false) { 
   echo shell_exec("bash SearchesToHTML.sh \"$response\"");
}else{
    echo "notRunning";
}

//message format isRunning=true;searches=,SEARCH waka waka;DELIMETERstatus=,0% 
?>
