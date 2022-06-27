<?php
	$playlist=$_POST["playlist"];
        echo shell_exec("bash playlist.sh \"$playlist\"");
?>
