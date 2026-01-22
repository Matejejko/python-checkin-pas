#!/usr/bin/env bash
set -e 

#ensure git command is present
#command -v git || exit 0

#fetch file content from git server (script.sh from script branch)
#option 1 curl <url> | bash
#curl 'https://raw.githubusercontent.com/Matejejko/python-checkin-pas/refs/heads/main/skript.sh'
#option 2 - store to variable/file and execute...

which git > /dev/null 2> /dev/null || {
        echo "command git not present, exitting..."
        exit 0
}

#make tmp dir, clone git repo under name 'myrepodir' 
tmpdir="$(mktemp -d tmp.XXXXXXX)"
cd "$tmpdir"
git clone 'git@github.com:Matejejko/python-checkin-pas.git' myrepodir
cd myrepodir

#switch to branch script
git branch -a
git checkout script

#run the script locally from repo
ls -la
pwd
./skript.sh




echo "--end of script--"
 
