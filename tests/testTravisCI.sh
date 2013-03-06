#!/bin/bash
#
# wrap builderCI script for a little debugging action
#

$BUILDER_CI_HOME/testTravisCI.sh
ls -altr *
ls -altr */*
cat travisCI/TravisTranscript.txt
