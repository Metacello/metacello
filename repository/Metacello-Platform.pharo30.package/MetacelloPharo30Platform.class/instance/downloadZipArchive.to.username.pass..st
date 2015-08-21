github support
downloadZipArchive: url to: outputFileName username: username pass: password
  "download zip archive from <url> into <outputFileName>"

	outputFileName asFileReference ensureDelete.
	ZnClient new
		url: url;
		username: username password: password;
		downloadTo: outputFileName.
    ^ ZipArchive new 
		readFrom: outputFileName asFileReference
