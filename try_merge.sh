#!/bin/bash

set -e

git status
git branch -D all 2>/dev/null || true
echo "============ fetch ============"
git fetch -p --all
echo "============   co  ============"
git checkout -b all origin/all
echo "============ merge ============"
#git merge -s theirs origin/$1
git merge -Xtheirs origin/$1
echo "============ push  ============"
git push ${DRYRUN}
