#!/bin/sh

repo_name=$1
test -z $1 && echo "Repo name required." 1>&2 && exit 1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u 'lichtwellenreiter':79131aa5f37f1592af4d7216aa3a103d5e04513c https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

type osascript &> /dev/null && (osascript -e "display notification \"Created Repository $repo_name on github.com\" with title \"Success !!\"") || echo "osascript is not available"


osascript -e 'tell application "Terminal" to close first window' & exit