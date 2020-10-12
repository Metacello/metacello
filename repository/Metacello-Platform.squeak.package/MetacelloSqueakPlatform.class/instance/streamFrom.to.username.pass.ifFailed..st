private
streamFrom: aUrlString to: aFileName username: username pass: pass ifFailed: aBlock

    |response |
    response := self httpGet: aUrlString username: username pass: pass do: [:req | ].
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