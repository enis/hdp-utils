#!/bin/bash

#
# Run this from an hdp repo root for any component. Example:
#
# git clone git@github.com:hortonworks/hbase.git 
# cd hbase 
# find_hdp_commit.sh HBASE-14759
#

if [ "$#" -eq "0" ] ; then
  echo "usage: $0 <commit_text> "
  exit
fi

COMMIT_TEXT=$1

echo "****************************************************"
echo "Greping commit ($COMMIT_TEXT) for HDP versions 2.1+";
echo "****************************************************"

HDP_VERSIONS="2.1 2.2 2.3 2.4"

git fetch -t 

for HDP_VERSION in $HDP_VERSIONS; do
  TAGS=`git tag | grep "HDP-$HDP_VERSION" | grep "tag"`

  for TAG in $TAGS; do
    echo "$TAG:"
    git log $TAG | grep $COMMIT_TEXT
  done 
done
