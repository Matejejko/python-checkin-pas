#!/usr/bin/env bash

#ensure git command is present
#command -v git || exit 0
which git > /dev/null 2> /dev/null || {
        echo "command git not present, exitting..."
        exit 0
}


tmpdir="$(mktmp -d tmp.xxxxxxxxx)"
cd "$tmpdir"
git clone 'git@github.com:Matejejko/python-checkin-pas.git' myrepodir
cd myrepodir

git branch -a
ls -la

echo "--end of script--"
 
