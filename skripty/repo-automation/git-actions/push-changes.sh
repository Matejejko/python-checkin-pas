#!/bin/bash

git add zmeny.txt
git commit -m "automated changes $(date)"
git push origin script

echo "zmeny boli commitnute a pushnute na branch script"
