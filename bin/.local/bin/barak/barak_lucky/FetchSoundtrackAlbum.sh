geniusSearchFile=$1

cat "$geniusSearchFile"  |  grep "<title>.*<\/title>" | sed 's/<\/title>//g;s/<title>//g;s/<title>//g;s/ Lyrics | Genius Lyrics//g;s/ | Genius//g;s/.* - //g;s/Lyrics and Tracklist//'
