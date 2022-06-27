geniusSearchFile=$1

Album=`cat "$geniusSearchFile" | sed -n '/song_album-info/,/song_album-info-artist/p' | grep -o -m 1 'title="[^"]*"' | sed 's/"//g;s/title=//'`
echo "album=$Album"


