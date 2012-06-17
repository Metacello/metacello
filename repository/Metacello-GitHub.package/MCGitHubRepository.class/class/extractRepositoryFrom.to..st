private
extractRepositoryFrom: zipFile to: directory
    "unzip zipFile -d directory"

    | out err proc |
    out := FileStream forceNewFileNamed: '/tmp/zip.out'.
    err := FileStream forceNewFileNamed: '/tmp/zip.err'.
    proc := OSProcess thisOSProcess
        forkJob: '/usr/bin/unzip'
        arguments:
            {'-u'.
            zipFile.
            '-d'.
            directory}
        environment: nil
        descriptors: (Array with: nil with: out with: err).
    proc ifNil: [ self noAccessorAvailable ].
    [ proc isRunning ] whileTrue: [ (Delay forMilliseconds: 100) wait ].
    out close.
    err close