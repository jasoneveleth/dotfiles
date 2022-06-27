# Usage: FetchLyrics.sh geniusLink
# Output: lyrics

geniusSearchFile=$1

cat "$geniusSearchFile" | sed -n '/<\!--sse/,/<\!--\/sse/p;' | sed -n '/<p>/,/<\/p>/p;' | sed -E 's/<a.*\{//g;s/referent.*,//g;s/referent.*,//g;s/referent.*(fragment_element_id)//g;s/}.*"//g;s/classification.*pending//g;s/<p>//g;s/<\/p>//g;s/<br>//g;s/<\/br>//g;s/<a>//g;s/<\/a>//g;s/<i>//g;s/<\/i>//g;s/>//g;s/<//g;s/\)//g;s/\(//g;s/ *$//g;s/ *$//;s/!--\/sse--//;/^$/d;s/^ *//;'| sed "s/^'$//"

# Explanation: `curl -s Link` returns the html of a website, -s for silently
#	       ` | ` puts the output from one program into the next
#	       `sed 's/REGEX/string/g'` returns a string but replaces all that matched the regular expression with string, g at the end to replace all matches
#	       the ; seperates multiple sed script commands
#		sed -n supress extra pattern space -E extended regular expression

# this is the equivalent individual sed scripts, removes tags and extra stuff
#sed -n '/<\!--sse/,/<\!--\/sse/p' 
#sed -n '/<p>/,/<\/p>/p' 
#sed -E 's/<a.*\{//g'
#sed -E 's/referent.*,//g'
#sed -E 's/referent.*,//g'
#sed -E 's/referent.*(fragment_element_id)//g'
#sed -E 's/}.*"//g' two.txt > one.txt
#sed -E 's/classification.*pending//g'
#sed -E 's/<p>//g'
#sed -E 's/<\/p>//g'
#sed -E 's/<br>//g'
#sed -E 's/<\/br>//g'
#sed -E 's/<a>//g'
#sed -E 's/<\/a>//g'
#sed -E 's/<i>//g'
#sed -E 's/<\/i>//g'
#sed -E 's/>//g'
#sed -E 's/<//g'
#sed -E "s/'//g"
#sed -E 's/\)//g'
#sed -E "s/&amp//g"
#sed -E 's/\(//g'
#sed -E 's/ *$//g'
#sed -E 's/	*$//g'
#sed -E 's/!--\/sse--//'
#sed '/^$/d'
