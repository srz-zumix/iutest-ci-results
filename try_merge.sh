#!/bin/bash

set -ex

function resolve_conflict() {
  set +x
#   git status
  for conflict in `git diff --name-only --diff-filter=U`; do
    echo $conflict
    git checkout --theirs "$conflict" && git add "$conflict" || git rm  "$conflict"
  done
  set -x
  git commit --file .git/MERGE_MSG
}

git status
git branch -D all 2>/dev/null || true
git fetch -p --all
git checkout -b all origin/all
git merge -Xtheirs origin/$1 || resolve_conflict
git push ${DRYRUN}
