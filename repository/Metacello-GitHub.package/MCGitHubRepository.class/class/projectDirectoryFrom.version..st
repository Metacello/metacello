utility
projectDirectoryFrom: projectPath version: versionString
    | url directory projectDirectory archive |
    url := 'https://github.com/' , projectPath , '/zipball/' , versionString.
    directory := (self cacheDirectoryFor: projectPath) directoryNamed: versionString.
    self downloadFile: url to: '/tmp/github.zip'.
    archive := ZipArchive new
        readFrom: (FileStream readOnlyFileNamed: '/tmp/github.zip');
        yourself.
    projectDirectory := directory directoryNamed: archive members first fileName.
    projectDirectory exists
        ifFalse: [ archive extractAllTo: directory ].
    ^ projectDirectory