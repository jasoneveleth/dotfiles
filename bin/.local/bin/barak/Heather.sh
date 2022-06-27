curl -s https://barakbinyamin.github.io/scriptedUSB/img/forHeather.txt

curl -s https://someresources.github.io/songs/boss.m4a -o boss.m4a
open boss.m4a --hide

#set general volume
osascript -e "set volume 5"

for percent in {1..100}; do
	volume=$percent

	#set itunes volume
	osascript -e "tell application \"Music\" to set sound volume to $volume"
	sleep .01
done
