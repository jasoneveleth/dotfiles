#!/bin/sh

# notes-git-update.sh
#
# usage:

set -e

cd ~/notes

DATE="$(date)"
printf "$DATE"

if git dirty; then
git add --all
git commit -m "automated commit"
git push origin main
git push github main
else
printf ':nothing to commit'
fi

printf '\n'

