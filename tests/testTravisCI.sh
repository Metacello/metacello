#!/bin/bash -x
#   - echo "running: $PROJECT_HOME/tests/$TRAVIS_SCRIPT"
   - ./build.sh -i $ST $BUILD_ARG -f "$PROJECT_HOME/tests/$TRAVIS_SCRIPT" -o travisCI
   - cd "${BUILD_PATH}/travisCI/"
   - ls -altr *
   - $BUILDER_CI_HOME/buildImageErrorCheck.sh
#   - cat TravisTranscript.txt
   - $BUILDER_CI_HOME/buildTravisStatusCheck.sh

