<?php
$search=$_POST['search'];
$playlist=$_POST['playlist'];
echo shell_exec("bash SearchesToHTML.sh $search");
shell_exec("exec 3<> CMDfifo;echo 'SEARCH $search PLAYLIST=$playlist'>>CMDfifo");

?>
