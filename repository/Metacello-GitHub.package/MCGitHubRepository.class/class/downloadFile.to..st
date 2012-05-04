private
downloadFile: url to: outputFileName
    " self downloadFile: 'https://github.com/dalehenrich/sample/zipball/1.0'"

    | in out err proc |
    in := (' -L ' , url) readStream.
    out := FileStream forceNewFileNamed: outputFileName.
    err := FileStream forceNewFileNamed: '/tmp/curl.err'.
    proc := OSProcess thisOSProcess
        forkJob: '/usr/bin/curl'
        arguments:
            {'-L'.
            url}
        environment: nil
        descriptors: (Array with: nil with: out with: err).
    proc ifNil: [ self noAccessorAvailable ].
    [ proc isRunning ] whileTrue: [ (Delay forMilliseconds: 100) wait ].
    out close.
    err close