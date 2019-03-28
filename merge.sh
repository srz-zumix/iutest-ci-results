#!/bin/sh

TARGET_BRANCH=$1
RETRY=${2:-5}

if [ -z ${TARGET_BRANCH} ]; then
  echo "./merge.sh <target_branch> [retry]"
  exit 1
fi

echo ${TARGET_BRANCH}:${RETRY}

for i in `seq 0 ${RETRY}`; do
  echo "i = $i"
  ./try_merge.sh ${TARGET_BRANCH}
  if [ $? -eq 0 ]; then
    exit 0
  fi
done

exit 1
