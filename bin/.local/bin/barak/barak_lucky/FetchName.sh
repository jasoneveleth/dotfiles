# Usage: FetchName geniusLink
# Output: Song DELIMETER Artist

geniusSearchFile=$1

cat "$geniusSearchFile" |  grep "<title>.*<\/title>" | sed 's/<\/title>//g;s/<title>//g;s/<title>//g;s/ Lyrics | Genius Lyrics//g;s/ | Genius//g' | sed 's/ – / DELIMETER /g'

# Explanation: `curl -s Link` returns the html of a website, -s for silently

#	       ` | ` puts the output from one program into the next

# 	       `grep "REGEX"` returns lines with matching regular expression. Regular expression is the standard notation for describing strings

#	       `sed 's/REGEX/string/g'` returns a string but replaces all that matched the regular expression with string, g at the end to replace all matches
