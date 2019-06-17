github support
downloadZipArchive: url to: outputFileName
	"download zip archive from <url> into <outputFileName>"

	outputFileName asFileReference ensureDelete.
	[ :bar | 
	bar title: 'Download: ' , url asString , ' to ' , outputFileName.
	[ ZnClient new
		url: url;
		signalProgress: true;
		downloadTo: outputFileName ]
		on: HTTPProgress
		do: [ :progress | 
			progress isEmpty
				ifFalse: [ bar current: progress percentage ].
			progress resume ] ] asJob run.
	^ ZipArchive new readFrom: outputFileName asFileReference
