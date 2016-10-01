*Metacello-GsCypress-MC
recordingSpecLoader
  ^ (MetacelloNullRecordingCypressSpecLoader on: self spec)
    loaderPolicy: self loaderPolicy copy;
    yourself