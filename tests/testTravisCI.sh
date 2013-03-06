#!/bin/bash -x
#
# wrap builderCI script for a little debugging action
#

$BUILDER_CI_HOME/testTravisCI.sh
if [[ $? != 0 ]] ; then 
  cat builds/travisCI/TravisTranscript.txt
  exit 1
fi
ls -altr builds/travisCI/TravisTranscript.txt
cat builds/travisCI/TravisTranscript.txt
