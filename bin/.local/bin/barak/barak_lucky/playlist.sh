#!/bin/bash

directory="`echo "$@" | grep -o "[A-Za-z0-9 :-]*"`"
declare -A months=( ["01"]="Jan" ["02"]="Feb" ["03"]="Mar" ["04"]="Apr" ["05"]="May" ["06"]="Jun" ["07"]="Jul" ["08"]="Aug" ["09"]="Sep" ["10"]="Oct" ["11"]="Nov" ["12"]="Dec")
html="<div class='playlistWrapper'>"
html="$html <div class=\"artWrapper\"> <div class=\"playlist\">"
		n=1

		for img in "$directory"/img/*.jpg; do
			html="$html <a style=\"background-image:url('$img');background-size:cover;\"></a>";
			if [[ $n -eq 4 ]]; then
				html="$html </div>"
				n=$((n+1))
				break
			fi

			n=$((n+1))
		done

		##idk whats going on...
		if [[ $((n)) -eq 5 ]]; then
			html="$html"
		else
			#echo $n
			for i in $(seq $((n)) 4); do 
				#echo img$n=$img
				html="$html <a style=\"background-image:url('$img');background-size:cover;\" a></a>";
			done
			html="$html </div></div>";
		fi


html="$html <div class=\"titleWrapper\"><div style=\"color: white;\">`echo "$directory" | sed "s/\///"`";
html="$html <div style=\"display:inline-block;\" onclick=\"download()\" class=\"download\">
  		<img src=\"/img/download.svg\" width=\"30px\" height=\"30px\">

	</div></div></div></div></div><br><br>"

#html="$html <div style=\"margin-left:10%;width:80%;height:1px;background-color:grey;\"></div><br><br>";

html="$html <div class=\"songs\">"
html="$html
        <div class=\"songTitle\">
                <div class=\"number\">#</div>
                <div><div class=\"albumArt\"></div></div>
		<div class=\"title\">
                        <div class=\"Titletitle\"> </div>
                        <div class=\"Titletitle\">Title</div>
                </div>
                <div class=\"Titlealbum\">Album</div>
		<div class=\"date\">Date Added</div>
                <div class=\"time\">Time</div>
        </div>
        <div></div>";
html="$html </div>";
html="$html <div style=\"margin-left:10%;width:80%;height:1px;background-color:grey;\"></div><br>"

html="$html <div class=\"songs\">"
n=0
IFS=$'\n'; for song in `ls --time=ctime "$directory"/*.m4a`; do #for song in "$directory"/*.m4a;do
	n=$((n+1))
	data=`AtomicParsley "$song" -t `
	songname=`echo "$data" | grep "Atom \"©nam\" contains:" | sed "s/.*: //"`
	artist=`echo "$data" | grep "Atom \"©ART\" contains:" | sed "s/.*: //"`
	album=`echo "$data" | grep "Atom \"©alb\" contains:" | sed "s/.*: //"`
	date="`stat "$song" | grep "Modify" | grep -Eo "[0-9]{4}-[0-9]{2}-[0-9]{2}" | sed "s/-/ /g"`"
	IFS=' ' read -r -a date <<< "$date"; day=`echo ${date[2]} `;
	m="${date[1]}"; month=${months[$m]}; year=${date[0]};
	#by="by"
	if [ -z "$songname"];then
		songname=`echo "$song" | sed "s/.*\///"`
	#	by=""
	fi
	albumArt=`echo "$song" | sed "s/\.m4a/.jpg/;s/\//\/img\//"`
	html="$html
	<div id=$n name=\"/$song\" onClick=\"play($n)\" class=\"song\">
		<div class=\"number\">$n</div>
		<div class=\"cover\"><img src=\"$albumArt\" onerror=\"this.onerror=null; this.src='getMusic.png'\" class=\"albumArt\" width=\"40px\" height=\"40px\"></div>
		<div class=\"title\">
			<div class=\"name\">$songname</div>
			<div class=\"artist\">$artist</div>
		</div>
		<div class=\"album\">$album</div>
		<div class=\"date\">$month $day, $year</div>
		<div class=\"time\">--</div>
	</div>
	<div class=\"download\">
		<a href=\"/$song\" download>
  		<img class="downloadImg" src=\"/img/download.svg\" width=\"40px\" height=\"40px\">
		</a>
	</div>"

done
html="$html </div>";
html="$html </div><br><br><div id=\"songcount\" style=\"display:none\">$n</div>"
echo "$html <br><br><br><br><br><br> "
