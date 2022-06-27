SEARCH="$@"

function google_search() {
	search=$SEARCH
	search=`echo $search | sed -e 's/ /\+/g;s/[&]/%26/g'`
	url='https://www.google.com/search?hl=en&q='$search


	#curl (-k)https (-s)silently and use User-agent "whatever" and (-L)follow redirects... | remove everything up to the first real url... replace the first amp with a marker, grep up to that marker, clean up and reformat the url
        html=`curl -k -sA 'Mozilla' -L "$url" | sed -e 's/.*href="\/url?q=https:\/\//href="\/url?q=https:\/\//;s/\&amp/HERE/;' | grep -Eoh 'href="/url?.*HERE' | sed -e 's/.*=//;s/HERE//' | sed -e 's/%3F/?/g;s/%3D/=/g;s/%2520/%20/g;'`
	#html=`curl -k -sA 'Mozilla' -L "$url" | grep -Po 'https://genius.com/[^  "/&]*lyrics'`
	#this doesn't work unless its here
 	html=`echo $html | sed -e 's/ .*//'`
	if [[ $html = *youtube* ]]; then
		youtube_search
		else
		echo $html
	fi
	
}

#google stores youtube links with fake hashes --> instead search youtube
function youtube_search() {
	search=$SEARCH
	search=`echo $search | sed -e 's/ /\+/g;s/[&]/%26/g;s/youtube//g'`
	url='https://www.youtube.com/results?search_query='$search

	links=`curl -k -sA "Mozilla" -L "$url" | grep -Eoh 'watch\?v=.{12}'`
	links=`echo $links | sed -e 's/ .*//'`

	link="https://www.youtube.com/"`echo $links | sed -e 's/"//g'`

	echo $link
}

if [[ $1 == *youtube* ]]; then
	youtube_search
	else
	google_search
fi





