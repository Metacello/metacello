github support
downloadZipArchive: url to: outputFileName username: username pass: pass
	"download zip archive from <url> into <outputFileName>. username:pass can be used to access resources with limited visibility but may be nil."

	| archive zipfile |
	self downloadBasicFile: url to: outputFileName username: username pass: pass.
	archive := ZipArchive new.
	zipfile := self fileHandleOn: outputFileName.
	zipfile readStreamDo: [ :fileStream | archive readFrom: fileStream ].
	^ archive