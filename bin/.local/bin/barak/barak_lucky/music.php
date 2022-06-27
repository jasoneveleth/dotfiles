<!DOCTYPE html>
<html>
<head>
<title>Music</title>
  <link rel="icon" href="img/icon.svg" type="image/svg" sizes="16x16">

 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/playlist.css">
</head>
<body>

<div class="navbar">
  <a class="a" href="/music.php">Library</a>
  <a class="a" href="/">Search Music</a>
</div>
<div style="padding-left:20px; margin-top:60px;-webkit-user-select: none;
  -ms-user-select: none;
  user-select: none;font-size:36px;">Music Library</div>
<div style="margin-left:20px; background-color: rgba(128, 128, 128, 0.3);
	width: 300px;
	height: 1px;"></div>
<div id="main">
</div>
<script>

$(document).ready(function(){
 $.ajax({
  url: 'populateMain.php',
  type: 'post',
  //data: {"callFunc1": "1"},
  success: function(response){
   // Perform operation on the return value
      document.getElementById("main").innerHTML=response;
  }
 });
});

</script>

</body>
</html>

