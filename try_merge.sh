#!/bin/sh

set -e

git status
git branch -D all
git fetch -p --all
git checkout -b all origin/all
git merge origin/$1
git push
