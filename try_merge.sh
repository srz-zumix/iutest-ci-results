#!/bin/bash

set -e

git status
git branch -D all 2>/dev/null || true
git fetch -p --all
git checkout -b all origin/all
git merge -s ours origin/$1
#git merge -Xours origin/$1
git push ${DRYRUN}
