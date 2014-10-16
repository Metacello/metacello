git-based http repo support
downloadBasicFile: url to: outputFileName
  "download from <url> into <outputFileName>"

  ^ self
    downloadBasicFile: url
    to: outputFileName
    username: nil
    pass: nil