#!/bin/bash -x
#
# wrap builderCI script for a little debugging action
#

ls -l builds/travisCI/TravisTranscript.txt
$BUILDER_CI_HOME/testTravisCI.sh
if [[ $? != 0 ]] ; then 
  exit 1
fi
cat builds/travisCI/TravisTranscript.txt
