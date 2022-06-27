# made a map of stages for each percentage
# seperate percentages and searches by delimeter, if the percentages are null, set them to zero 
# output the corrosponding html for each search
#
declare -A percentDictionary
percentDictionary["0%"]="Searching Genius.com For Title..."
percentDictionary["25%"]="Searching Genius.com For Album Art & Lyrics..."
percentDictionary["50%"]="Downloading  m4a Via Youtube-dl..."
percentDictionary["75%"]="Adding Artist, Lyrics, Album Art, and Album Title..."
percentDictionary["90%"]="..."
percentDictionary["95%"]="..."
percentDictionary["100%"]="Search Complete"
percentDictionary["Failed."]="Search Failed, Try Being More Specific"
percentDictionary["Failed..."]="Search failed, found an album, not a song, type album to search for an album"

html="$html <div class=\"searches\">"

args="`echo "$@" | sed "s/isRunning=true;searches=,//"`"
percents="`echo "$args" | grep -o ";DELIMETER.*" | sed "s/;DELIMETERstatus=,//"`"
searches="`echo "$args" | sed "s/;DELIMETER.*//"`"

IFS=',' read -r -a percents <<< "$percents"

IFS=',' read -r -a searches <<< "$searches"

if [ -z "${percents}" ]; then
	for searchIndex in ${!searches[@]};do
		percents[$searchIndex]="0%"
	done;
fi

for searchIndex in ${!searches[@]};do
	search="${searches[searchIndex]}"
 	imgPath=`echo $search | sed -E "s/[^a-zA-Z0-9 ()-]//g" | sed "s/by/-/" | tr -d "[:blank:]"`
	html="$html <div class=\"card\">
  <div class=\"search-container\"><a style=background-image:url('/img/$imgPath.jpg');background-size:cover;\" class=\"album\"></a>
  <div class=\"title\">$search</div>"
	percent="${percents[searchIndex]}"
	html="$html  <div class=\"prompt\">${percentDictionary[$percent]}</div>
  <div class=\"percent\">$percent</div>"

	html="$html </div></div>"
done

html="$html </div>"
echo "$html"
