github support
downloadFile: url to: outputFileName
    "download from <url> into <outputFileName>"

	| archive zipfile |
	System performOnServer: '/usr/bin/curl -L ', url, ' > ', outputFileName, ' 2> /tmp/curl.err'.
	archive := ZipArchive new.
	zipfile := ServerFileDirectory on: outputFileName.
	zipfile containingDirectory 
		readOnlyFileNamed: zipfile localName
		do: [:fileStream | archive readFrom: fileStream ].
	^archive