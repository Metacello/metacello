github support
downloadZipArchive: url to: outputFileName
  "download zip archive from <url> into <outputFileName>"

    | archive zipfile |
    self downloadBasicFile: url to: outputFileName username: nil pass: nil.
    archive := ZipArchive new.
    zipfile := self fileHandleOn: outputFileName.
    zipfile parent readOnlyFileNamed: zipfile basename do: [ :fileStream | archive readFrom: fileStream ].
    ^ archive
