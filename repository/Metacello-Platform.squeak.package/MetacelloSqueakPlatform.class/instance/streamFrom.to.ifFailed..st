private
streamFrom: aUrlString to: aFileName ifFailed: aBlock

    |response |
    response := WebClient httpGet: aUrlString.
    response isSuccess ifFalse: [^ aBlock value: response].
    " some sites do not indicate error codes but rather just 200 with html..., we expect zip"
    (response contentType beginsWith: 'text/') ifTrue: [^ aBlock value: response].
    
    ^ FileDirectory activeDirectoryClass
        splitName: aFileName
        to: [:path :file |
            (FileDirectory on: path)
                assureExistence;
                forceNewFileNamed: file do:
                    [:stream | response
                        streamTo: stream binary
                        size: response contentLength
                        progress: (self downloadProgressFor: aUrlString)]]