html="$html <div class='playlists'>"

IFS=$'\n'; for directory in `ls --time=ctime -d */`; do
        none=`find "$directory"*.m4a`
	if [ "$?" -eq "0" ]; then
		html="$html <div class='coverTitle'> <div class='playlist'>"
		n=1

		for img in "$directory"img/*.jpg; do
			html="$html <a style=\"background-image:url('$img');background-size:cover;\" href=\"/playlist.php?playlist=$directory\"></a>";
			if [[ $n -eq 4 ]]; then
				html="$html </div> <div style=\"padding-left:10px;\">`echo $directory | sed "s/\///"`</div>";
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
				html="$html <a style=\"background-image:url('$img');background-size:cover;\" href=\"/playlist.php?playlist=$directory\"></a>";
			done
			html="$html </div> <div style=\"padding-left:10px;\">`echo $directory | sed "s/\///"`</div>";
			html="$html </div>";
		fi
	fi
done


html="$html </div> <br> <br>"

echo $html

# for directory in directories, if the directory has a song in it, make a playlist cover and add up to four images to it
# if the playlist cover doesn't have four images, add the last image until 4 image covers have been added
#
#
#
#
#








