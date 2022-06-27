#trap 'kill $(jobs -p);rm $pid.*; rm $name.m4a;' EXIT
#trap "kill 0" EXIT
#trap "rm $pid.*; rm $name.m4a;exit" SIGKILL SIGTERM

SongbyArtist="$@"
Loading="false"
Albumlink=""
Ylink=""
playlistdir=music
tracknum="1"

    searchIndex=`echo $SongbyArtist | grep -o "searchIndex=[0-9]*" | sed 's/searchIndex=//'`
    SongbyArtist=`echo $SongbyArtist | sed 's/searchIndex=[0-9]*//'`

    if [[ "$SongbyArtist" = *LOADING* ]]; then
    Loading="true"
    tracknum=`echo "$SongbyArtist" | grep -oh 'NUM[0-9]*' | sed 's/NUM//'`
    playlistdir=`echo "$SongbyArtist" | grep -oh 'LOADING.*' | sed 's/LOADING //;s/ NUM[0-9]*//g;'| sed "s/[ ]*$//"`
    SongbyArtist=`echo "$SongbyArtist" | sed 's/ LOADING.*//g'`
    fi



    if [[ "${SongbyArtist,,}" = *http* ]]; then
	 Albumlink=$SongbyArtist
	else
    	Albumlink=`bash ImFeelingLucky2.sh "genius $SongbyArtist"`
    fi

    searchTest="`echo $Albumlink | grep -o ".*genius\.com"`"
    if [[ ${#searchTest} -eq 0 ]];then
    	echo "updateStatus $searchIndex;Failed.">CMDfifo
	sleep 3
	exit
    fi
    searchTest="`echo $Albumlink | sed "s/.*genius\.com\///" | grep -o "/"`"
    if [[ ${#searchTest} -gt 0 ]];then
    	echo "updateStatus $searchIndex;Failed...">CMDfifo
	sleep 3
	exit
    fi

    pid=$$
    curl -s $Albumlink -o $pid.html

    FetchName=`bash 'FetchName.sh' $pid.html`
    artist1=`echo "$FetchName" | grep -o ".* DELIMETER " | sed "s/ DELIMETER //"`
    title=`echo "$FetchName" | grep -o "DELIMETER.*" | sed "s/DELIMETER //"`
    if [ ${#title} -eq 0 ]; then
    title="$SongbyArtist"
    fi
    echo "getsong.sh: Finding $title by $artist1"


    name=`echo "$title-$artist1" | sed -E "s/[^a-zA-Z0-9 ()-]//g" | tr -d "[:blank:]"` #keep only non special character
    echo "name=$name"
    Ylink=`bash ImFeelingLucky2.sh "youtube $name by $artist1 hq hq lyrics"`

    bash 'FetchAlbumArt.sh' "$pid.html" "$pid"
    cover=`find . -type f -name "$pid.png"`
    yes | ffmpeg -hide_banner -loglevel quiet -i "$pid.png" -vf scale=1600:1600 "$name.jpg"
    cp "$name.jpg" "img/"
    mv "$name.jpg" "$playlistdir/img/"
    if [ ${#cover} -eq 0 ]; then
    cover="getMusic.png"
    fi

    if [ ${#searchIndex} -eq 0 ]; then
        echo 25%
    else
        echo "updateSongs $searchIndex;$title by $artist1">CMDfifo
        echo "updateStatus $searchIndex;25%">CMDfifo
    fi



    lyrics=`bash 'FetchLyrics.sh' "$pid.html"`
    album=`bash 'FetchAlbum.sh' "$pid.html" | sed "s/album//g;s/=//g"`


    echo "updateStatus $searchIndex;50%">CMDfifo

   #timeout 100 youtube-dl  -q --extract-audio --audio-format mp3 "${Ylink}" -o "$pid.mp3"
   timeout 100 youtube-dl -q -f 'bestaudio[ext=m4a]' "${Ylink}" -o "$name.m4a"
   if [ "$?" = "210" ]; then
	 echo TIMEOUT song-request timed out, the requested song: $name is too long;
	 if [ "$cover" != "getMusic.png" ]; then
    	 rm "$cover"
         fi
	 exit
    fi

    if [ ${#searchIndex} -eq 0 ]; then
	echo 75%
    else
	echo "updateStatus $searchIndex;75%">CMDfifo
    fi

    rm $pid.html
    #ffmpeg -hide_banner -loglevel quiet -i "$pid.mp3" -metadata title="$title" -metadata artist="$artist1" -metadata album="$album" -metadata lyrics="$lyrics" "$name.m4a"
    #ffmpeg -i "output.m4a" -i "$cover" -map_metadatas 0 -map 0 -map 1 "$name.m4a"s
    #xdg-open $cover //testing for you make me feel so young frank sinatra, image does't match when album name is ""
    #read -p "type: " yup
    #echo "$name.m4a"
    #AtomicParsley "$name.m4a" --artwork "$cover" --compilation "true" --overWrite 
    AtomicParsley "$name.m4a" --artwork "$cover" --artist "$artist1" --title "$title" --album "$album" --lyrics "$lyrics" --compilation "true" --overWrite 
    #rm "$pid.mp3"

    mv "$name.m4a" "$playlistdir"
    if [ "$cover" != "getMusic.png" ]; then
    	rm "$cover"
    fi
    #if [ $Loading = "false" ]; then
    #cd $playlistdir;
    #vlc "$name.m4a" && rm "$name.m4a"
    #else
    AtomicParsley "$playlistdir/$name.m4a" --tracknum $(($tracknum)) --overWrite
    #fi
    if [ ${#searchIndex} -eq 0 ]; then
        echo 100%
    else
        echo "updateStatus $searchIndex;100%">CMDfifo
    fi
