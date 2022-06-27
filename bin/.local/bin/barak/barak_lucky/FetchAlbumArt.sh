# Usage: FetchLyrics.sh geniusLink pid
# Output: cover.png

geniusSearchFile=$1
pid=$2

#wget --user-agent="Mozilla"  --output-document output.html "$Albumlink" 
ImageLink=`cat "$geniusSearchFile" | sed -n '/cover_art-image/,/header_with_cover_art-primary_info_container/p' | grep -o 'https\?://\S*\.[A-Za-z]\+\s' | sed 's/ //g'`

#echo "${ImageLink##*1} is the file ending" #wierd but gets last three 
FileEnding=`echo ${ImageLink##*1} | sed "s/\.//g"` #remove any .

yes | ffmpeg -hide_banner -loglevel quiet -i "$ImageLink" -vf scale=1600:1600 "$pid.png"

