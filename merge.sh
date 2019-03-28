#!/bin/sh

RETRY=$1
TARGET_BRANCH=$2

for i in `seq 0 ${RETRY}`; do
  echo "i = $i"
  try_merge.sh ${TARGET_BRANCH}
  if [ $? -eq 0 ]; then
    exit 0
  fi
done

exit 1
