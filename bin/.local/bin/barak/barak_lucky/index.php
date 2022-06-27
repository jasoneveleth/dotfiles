<!DOCTYPE html> <html>
 <head>
 <title>Music</title>
 <meta charset="UTF-8">
  <link rel="icon" href="img/icon.svg" type="image/svg" sizes="16x16">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/getmusic.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<div class="navbar">
  <a class="a" href="/music.php">Library</a>
  <a class="a" href="/">Search Music</a>
</div>
<div style="padding-top: 50px;margin-left: auto; margin-right: auto; display:block;" id="message"><div>
<div id="main" class="main">

<script>
isRunning=false;

function getUpdate(){
	$('.testimonial').each(function(i, obj) {
    //test
	});
}


function Search(){
    var input = $('#search').val();

    // if / else has been turned
    if(/^[A-Za-z0-9 ,]+$/.test(input)){
	document.getElementById("stop").style.display = "block";
	document.getElementById("searchContainer").style.display = "none";
        $.ajax({
  	url: 'Search.php',
  	type: 'post',
  	data: {"search": document.getElementById("search").value, "playlist":document.getElementById("playlist").value},
  	success: function(response){
   	// Perform operation on the return value
	//console.log(response);
	document.getElementById("main").innerHTML=response;
  		}
 	});
    } else {
        $('#search').css('border', '1px #CCC solid');
	document.getElementById("info").innerHTML = "Please use only A-Z, a-z, 0-9, commas and spaces in your song searches";
    }
document.getElementById("search").value = "";
}

function stopSearch(){
	document.getElementById("message").innerHTML = "stopping search...";
        $.ajax({
  	url: 'stop.php',
  	type: 'post',
  	success: function(response){
  		}
 	});
    }

window.addEventListener("keydown", function (e) {
  	handleKeys(event.key); 
});

function handleKeys (char){
        if (char=="Enter"){
                if (document.activeElement.nodeName == 'TEXTAREA' && $("#search").val().length>3) {
			document.getElementById('searchButton').click();
		}else if (document.activeElement.nodeName == 'INPUT'){
			document.getElementById('search').focus();
                }
        }
}

</script>


<div  id="searchContainer" action="" method="post" class="textarea" style="display:none;">
  <div id="info"></div>
    <input class="textareaFont" placeholder="Enter your playlist title" id="playlist" maxlength="30" size="34%" type="text"><br>
  <textarea class="textareaFont" id="search" onInput="limitInput(value)" name="search" style="font-size: 3vh;resize:resize:none;" pattern="[A-Za-z0-9 ,]*" title="Please use only A-Z, a-z, 0-9, commas and spaces in your song searches" 
 placeholder='Seperate searches by ",", you can search for songs by lyrics, or by name. Search for whole albums by using the keywords "album" or "soundtrack"' rows="15" cols="25" ></textarea><br><br>
  <input id="searchButton" for="search" value="Search" type="submit">
</div>

</div>

 <!--<h2 id="searching" style="text-align:center;" center>searching for songs in your playlist, seraches may take up to a minute per song</h2>---->
 <input style="display:block;margin-top:20px;margin-left:auto;margin-right:auto;" id="stop" onClick="stopSearch()" value="Stop Search" type="submit">


<script src="js/textbox.js"></script>

<script>
var isRunning=false;
function turnOnSearch(){
	document.getElementById("searchContainer").style.display = "";
	document.getElementById("stop").style.display = "none";
}
function GotoLibrary(){location.href = "/music.php";}

function IsRunning(){
 $.ajax({
  url: 'isRunning.php',
  type: 'post',
  //data: {"callFunc1": "1"},
  success: function(response){
   // Perform operation on the return value
   if (response=="notRunning"){
		clearInterval(isRunningInterval);
		setTimeout(GotoLibrary, 5000);
	}
	else{
		//console.log(response);
		document.getElementById("main").innerHTML=response;
		//var unique = $.now();
		//$('a').attr('src', 'http://localhost/captcha.php?' + unique);
	}
  	}
 });
}

function start(){
isRunningInterval = setInterval(IsRunning, 3000);
}

function initIsRunning(){
 $.ajax({
  url: 'isRunning.php',
  type: 'post',
  //data: {"callFunc1": "1"},
  success: function(response){
   // Perform operation on the return value
   if (response=="notRunning"){
		turnOnSearch();
	}
	else{
		document.getElementById("main").innerHTML=response;
		start();
	}
  }
 });
} 


// Add event listener to table
const element = document.getElementById("searchButton");
element.onclick = function() { var isRunning=true; isRunning=true;start();Search(); };

$( document ).ready(function() {
	initIsRunning();
});

</script>

</body>
</html>

