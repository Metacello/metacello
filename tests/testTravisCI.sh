#!/bin/bash
#
# Generic test driver script for builderCI
#
#      -verbose flag causes unconditional transcript display
#
# Copyright (c) 2012-2013 VMware, Inc. All Rights Reserved <dhenrich@vmware.com>.
#

echo "Load list: ${LoadList}"

cat << EOF > $PROJECT_HOME/tests/travisPre.st
Transcript cr; show: 'travis---->travisPre.st'.

Smalltalk 
  at: #'TRAVIS_LOAD_LIST'
  put: #( ${LoadList} ).
EOF

./build.sh -i $ST -m -f "$PROJECT_HOME/tests/travisPre.st" -f "$PROJECT_HOME/tests/$TRAVIS_SCRIPT" -o travisCI
if [[ $? != 0 ]] ; then 
  echo "ERROR: $(basename $0)"
  cd "${BUILD_PATH}/travisCI/"
  $BUILDER_CI_HOME/buildImageErrorCheck.sh # dump Transcript on error and exit
  if [[ $? != 0 ]] ; then exit 1; fi
  $BUILDER_CI_HOME/dumpTranscript.sh
  exit 1
fi
cd "${BUILD_PATH}/travisCI/"
$BUILDER_CI_HOME/buildImageErrorCheck.sh # dump Transcript on error and exit
if [[ $? != 0 ]] ; then exit 1; fi
$BUILDER_CI_HOME/buildTravisStatusCheck.sh "$@" # dump Transcript on failed tests and exit
if [[ $? != 0 ]] ; then exit 1; fi

