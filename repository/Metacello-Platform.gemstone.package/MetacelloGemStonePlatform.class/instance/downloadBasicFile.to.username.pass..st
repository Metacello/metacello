git-based http repo support
downloadBasicFile: url to: outputFileName username: username pass: pass
  "download from <url> into <outputFileName>"

  ^ self
    downloadBasicFile: url
    to: outputFileName
    includeHTTPHeader: false
    username: username
    pass: pass