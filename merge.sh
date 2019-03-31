#!/bin/sh

usage_exit() {
        echo "Usage: $0 [-d] [-n] [-r retry_count] <branch_name>" 1>&2
        exit 1
}

RETRY=5
REMOVE_REMOTE_BRANCH=0
DRYRUN=

while getopts dnr:h OPT
do
  case $OPT in
    d)  REMOVE_REMOTE_BRANCH=1
      ;;
    r)  RETRY=$OPTARG
      ;;
    n)  DRYRUN=-n
      ;;
    h)  usage_exit
      ;;
    \?) usage_exit
      ;;
  esac
done

shift $((OPTIND - 1))

TARGET_BRANCH=$1
if [ -z ${TARGET_BRANCH} ]; then
  echo "./merge.sh <target_branch> [retry]"
  usage_exit
fi

echo ${TARGET_BRANCH}:${RETRY}

for i in `seq 0 ${RETRY}`; do
  echo "i = $i"
  ./try_merge.sh ${TARGET_BRANCH}
  if [ $? -eq 0 ]; then
    if [ ${REMOVE_REMOTE_BRANCH} -ne 0 ]; then
      git push ${DRYRUN} --delete origin ${TARGET_BRANCH}
    fi
    exit 0
  fi
done

exit 1
