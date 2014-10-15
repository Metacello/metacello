github support
downloadZipArchive: url to: outputFileName
  "download zip archive from <url> into <outputFileName>"

    | in out err proc archive zipfile errorFileName|
    "Make a unique name for the error log and ensure that we can write the files"
    errorFileName := self downloadErrorFileNameFor: outputFileName.
    in := (' -L ' , url) readStream.
    out := FileStream forceNewFileNamed: outputFileName.
    err := FileStream forceNewFileNamed: errorFileName.
    proc := OSProcess thisOSProcess
        forkJob: '/usr/bin/curl'
        arguments:
            {'-L'.
            url}
        environment: nil
        descriptors: (Array with: nil with: out with: err).
    proc ifNil: [ OSProcess noAccessorAvailable ].
    [ proc isRunning ] whileTrue: [ (Delay forMilliseconds: 100) wait ].
    out close.
    err close.
    archive := ZipArchive new.
    zipfile := outputFileName asFileReference.
    zipfile readStreamDo: [ :fileStream | archive readFrom: fileStream ].
    ^ archive
