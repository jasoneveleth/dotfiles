<?php
$playlist=$_POST["playlist"];
echo shell_exec("bash zip.sh \"$playlist\"")
?>
