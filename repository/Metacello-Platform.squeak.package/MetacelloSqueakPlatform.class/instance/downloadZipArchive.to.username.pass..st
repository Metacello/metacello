github support
downloadZipArchive: url to: outputFileName username: username pass: pass
  "download zip archive from <url> into <outputFileName>. username:pass can be used to access resources with limited visibility but may be nil."

    self streamFrom: url to: outputFileName username: username pass: pass ifFailed: 
	[:response | | message |
        message := response content.
        response close.
        ^ self error: 'Error downloading ', url, ' to ', outputFileName, '. Server said: ', message].

    ^ ZipArchive new readFrom: outputFileName