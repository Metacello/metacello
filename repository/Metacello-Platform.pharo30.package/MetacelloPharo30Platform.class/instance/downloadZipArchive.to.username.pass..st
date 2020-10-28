github support
downloadZipArchive: url to: outputFileName username: username pass: pass
	"download zip archive from <url> into <outputFileName>. username:pass can be used to access resources with limited visibility but may be nil."

	outputFileName asFileReference ensureDelete.
	ZnClient new
		url: url;
		username: username password: pass;
		downloadTo: outputFileName.
    ^ ZipArchive new 
		readFrom: outputFileName asFileReference
