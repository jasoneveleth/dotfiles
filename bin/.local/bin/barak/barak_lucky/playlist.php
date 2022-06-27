<!DOCTYPE html>
<html>
<head>
<title>Music</title>
  <link rel="icon" href="img/icon.svg" type="image/svg" sizes="16x16">

 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/playlistPage.css">
<link rel="stylesheet" href="css/playlist.css">

</head>
<body>

<div class="navbar">
  <a class="a" href="/music.php">Library</a>
  <a class="a" href="/">Search Music</a>
</div>

<div class="main" id="main" style="margin-top:100px;align:center;text-align:center;">
	<style>
		.loader {margin-top:200px;margin-left:auto;margin-right:auto;border: 4px solid #f3f3f3;border-radius: 10%;border-top: 4px solid #242b3b;
		width: 60px;height: 60px;-webkit-animation: spin 2s linear infinite; /* Safari */animation: spin 1s linear infinite;
		}
		/* Safari */
		@-webkit-keyframes spin {0% { -webkit-transform: rotate(0deg); }100% { -webkit-transform: rotate(360deg); }}
		@keyframes spin {0% { transform: rotate(0deg); }100% { transform: rotate(360deg); }}
	</style>
	<div class="loader"></div>
</div>

<div id="playlist" style="margin-top: 100px; display:none">
<?php
echo $_GET["playlist"];
?>
</div>

<script>

$(document).ready(function(){
 directory=document.getElementById("playlist").innerHTML;
 $.ajax({
  url: 'playlistPHP.php',
  type: 'post',
  data: {"playlist": directory},
  success: function(response){
   // Perform operation on the return value
      document.getElementById("main").innerHTML=response;
      play(1);
  }
 });
});

function download(){
  var str = location.href;
  var n = str.search(/\=/i);
  directory = str.substr(n+1,100);
 console.log(directory);
 $.ajax({
  url: 'download.php',
  type: 'post',
  data: {"playlist": directory},
  success: function(response){
   // Perform operation on the return value
	location.href = response;
  }
 });
}
</script>
      <div class="playerWrapper">
      <img class="skip" onClick="skip();" src="/img/skip.svg">
      <div style="">
               <audio id="player" song=1 class="audio" autoplay controls webkit-playsinline x-webkit-airplay="" poster="img/WhereYAt-TromboneShorty.jpg" title="Awesome Music"">
                       <source src="" type="audio/mpeg">
               </audio>
      </div>
      <img class="skip" onClick="skipback();" src="/img/skipback.svg">
      </div>
      <script src="js/player.js"></script>
</body>
</html>

