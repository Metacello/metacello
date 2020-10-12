github support
downloadZipArchive: url to: outputFileName username: username pass: pass
	"download zip archive from <url> into <outputFileName>. username:pass can be used to access resources with limited visibility but may be nil."

	outputFileName asFileReference ensureDelete.
	[ :bar | 
	bar title: 'Download: ' , url asString , ' to ' , outputFileName.
	[ ZnClient new
		url: url;
		username: username password: pass;
		signalProgress: true;
		downloadTo: outputFileName ]
		on: HTTPProgress
		do: [ :progress | 
			progress isEmpty
				ifFalse: [ bar current: progress percentage ].
			progress resume ] ] asJob run.
	^ ZipArchive new readFrom: outputFileName asFileReference
