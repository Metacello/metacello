#!/bin/bash -x
#
# wrap builderCI script for a little debugging action
#

$BUILDER_CI_HOME/testTravisCI.sh
if [[ $? != 0 ]] ; then 
  ls -altr *
  ls -altr */*
  cat builds/travisCI/TravisTranscript.txt
  exit 1
fi
ls -altr *
ls -altr */*
cat builds/travisCI/TravisTranscript.txt
