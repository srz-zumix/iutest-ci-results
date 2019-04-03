#!/bin/bash

set -ex

git status
git branch -D all 2>/dev/null || true
git fetch -p --all
git checkout -b all origin/all
git merge -Xtheirs origin/$1
git push ${DRYRUN}
