github support
downloadZipArchive: url to: outputFileName
  "download zip archive from <url> into <outputFileName>"

    self streamFrom: url to: outputFileName ifFailed: 
	[:response | | message |
        message := response content.
        response close.
        ^ self error: 'Error downloading ', url, ' to ', outputFileName, '. Server said: ', message].

    ^ ZipArchive new readFrom: outputFileName
           