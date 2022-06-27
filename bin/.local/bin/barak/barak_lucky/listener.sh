#!/bin/bash

mkfifo CMDfifo
mkfifo respnsefifo
isRunning=false
searches=[]
status=[]
process=""

#returns if the server is searcing for music, and if so what is the status of the searches and the searches themselves
check()  {
	if $isRunning; then
		searchesString="searches="
		for i in ${!searches[@]};
		do
		search="${searches[i]}"
		searchesString="$searchesString,$search"
		done


		statusString="status="
		for i in ${!status[@]};
		do
		search="${status[i]}"
		statusString="$statusString,$search"
		done

		echo "listener.sh: isrunning=$isRunning"
		echo "isRunning=$isRunning;$searchesString;DELIMETER$statusString">respnsefifo
	else
		echo "listener.sh: isRunning=$isRunning"
		echo "isRunning=$isRunning;">respnsefifo
	fi
}



search() {
	musicSearch=`echo "$@" | sed 's/SEARCH //;s/PLAYLIST=.*//;s/^[ ]*//'` # remove search and leading white space   
	playlist=`echo "$@" | sed 's/.*PLAYLIST=//;'`
	echo $musicSearch
	if [ ${#musicSearch} -eq 0 ]; then
		echo no search
	else
		isRunning=true
		IFS=',' read -r -a searches <<< "$musicSearch"

		for searchIndex in ${!searches[@]};
		do
		     status[$searchIndex]="0%"
		done
		bash Search.sh "$musicSearch" "$playlist" &
		process=$!
	fi

}

UpdateSongs() {
	searchIndex=`echo "$@" | grep -o "[^;]*;" | sed "s/;//" | grep -o "[0-9]*"`
	songName=`echo "$@" | grep -o ";.*" | sed "s/;//"`
	searchIndex=$((searchIndex))
	searches[$searchIndex]="$songName"
	echo "listener.sh,UpdateSongs(): searchArray: ${searches[@]}"
}

UpdateStatus() {
	searchStatus=`echo "$@" | grep -io "complete"`
	if [ ${#searchStatus} -eq 0 ]; then
		searchIndex=`echo "$@" | grep -o "[^;]*;" | sed "s/;//" | grep -o "[0-9]*"`
		searchStatus=`echo "$@" | grep -o ";.*" | sed "s/;//"`
		status[ $((searchIndex)) ]="$searchStatus"
	else
		isRunning=false
		echo "isrunning is now false"
	fi
	echo "listener.sh,UpdateStatus(): statusArray=${status[@]}"
}

stop() {
	kill $process;
	isRunning=false;
}

while true;
	do
		read cmd<CMDfifo;
		if [[ "$cmd" =~ .*check.* ]]; then
			echo listener.sh: checking
			check
		elif [[ "$cmd" =~ .*SEARCH.* ]]; then
			echo listener.sh $$: searching
			search "$cmd"
		elif [[ "$cmd" =~ .*updateSongs.* ]]; then
			echo listener.sh $$: updating song title
			UpdateSongs "$cmd"
		elif [[ "$cmd" =~ .*updateStatus.* ]]; then
			echo listener.sh $$: updating status
			UpdateStatus "$cmd"
		elif [[ "$cmd" =~ .*STOP.* ]]; then
			echo listener.sh $$: stopping search
			stop
		else
			echo listener.sh $$: "random command - $cmd"
		fi
	done
