github support
extractRepositoryFrom: zipFile to: directory
    	"unzip <zipFile> into <directory>"

	| errorMessage |
	(ServerFileDirectory on: directory) assureExistence.
	System performOnServer: '/usr/bin/unzip -u ', zipFile, ' -d ', directory, ' 2> /tmp/zip.err'.
	(ServerFileDirectory on: '/tmp')
        fileNamed: 'zip.err'
        do: [ :fileStream | 
            (errorMessage := fileStream contentsOfEntireFile) notEmpty
                ifTrue: [ self error: 'unzip failure: ' , errorMessage printString ] ]