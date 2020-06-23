#!/bin/sh

repo_name="FHNW_"$1
test -z $1 && echo "Repo name required." 1>&2 && exit 1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u 'lichtwellenreiter':79131aa5f37f1592af4d7216aa3a103d5e04513c https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"


mkdir ~/Programmieren/FHNW/$1
cd ~/Programmieren/FHNW/$1

git init
git remote add origin https://github.com/lichtwellenreiter/$repo_name.git

echo "Repo for FHNW $1 Module" > README.md

echo "MIT License

Copyright (c) $(date +"%Y") lichtwellenreiter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE." > LICENSE.md

echo ".idea\n" > .gitignore
echo ".DS_Store" >> .gitignore

git add .

git commit -m "init repo, added readme and license"

git push -u origin master


type osascript &> /dev/null && (osascript -e "display notification \"Created Repository $repo_name on github.com\" with title \"Success !!\"") || echo "osascript is not available"


osascript -e 'tell application "Terminal" to close first window' & exit