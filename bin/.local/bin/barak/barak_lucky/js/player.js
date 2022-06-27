musicPlayer=document.getElementById("player");
$("#player").bind("ended", function (){
	count=parseInt(document.getElementById("songcount").innerHTML);
	upNext=musicPlayer.song+1;
	if (!(upNext>=count)) {
		currentSongDiv=document.getElementById(upNext-1);
		upNextDiv=document.getElementById(upNext);
		songPath=upNextDiv.getAttribute("name");
		currentSongDiv.classList.remove('violet');
		upNextDiv.classList.add('violet');
		musicPlayer.song=upNext;
		musicPlayer.src=songPath;
		musicPlayer.title=upNextDiv.textContent;
		musicPlayer.load();
		musicPlayer.play();
	}
});

function play(N) {
	count=parseInt(document.getElementById("songcount").innerHTML);
	for (I=1;I<=count;I++){
		song=document.getElementById(I);
		song.classList.remove('violet');
		song.classList.add('title');
	}

	songDiv=document.getElementById(N);
	songDiv.classList.add("violet");
	musicPlayer=document.getElementById("player");
	musicPlayer.song=N;
	musicPlayer.pause();
	musicPlayer.src=songDiv.getAttribute("name");
	musicPlayer.load();
	musicPlayer.play();
}

function skip (){
        count=parseInt(document.getElementById("songcount").innerHTML);
        upNext=musicPlayer.song+1;
        if (!(upNext>count)) {
                currentSongDiv=document.getElementById(upNext-1);
                upNextDiv=document.getElementById(upNext);
                songPath=upNextDiv.getAttribute("name");
                currentSongDiv.classList.remove('violet');
                upNextDiv.classList.add('violet');
		musicPlayer.song=upNext;
                musicPlayer.src=songPath;
                musicPlayer.title=upNextDiv.textContent;
                musicPlayer.load();
                musicPlayer.play();
        }
}

function skipback () {
        upNext=musicPlayer.song-1;
        if (!(upNext<1)) {
                currentSongDiv=document.getElementById(upNext+1);
                upNextDiv=document.getElementById(upNext);
                songPath=upNextDiv.getAttribute("name");
                currentSongDiv.classList.remove('violet');
                upNextDiv.classList.add('violet');
		musicPlayer.song=upNext;
                musicPlayer.src=songPath;
                musicPlayer.title=upNextDiv.textContent;
                musicPlayer.load();
                musicPlayer.play();
        }
}

window.addEventListener("keydown", function (e) {
  pausePlay(event.key); 
});

function pausePlay (char){
	if (char==" " || char=="Enter"){
		if  (musicPlayer.paused){
			musicPlayer.play();
		}else{
			musicPlayer.pause();
		}
	}else if (char=="ArrowRight" || char=="ArrowDown"){
		skip();
	}
	else if (char=="ArrowLeft" || char=="ArrowUp"){
		skipback();
        }
}
