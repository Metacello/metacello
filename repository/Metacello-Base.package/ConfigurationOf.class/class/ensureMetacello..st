private
ensureMetacello: loadList
    "Bootstrap Metacello, retry using alternate repository, if primary repository is not accessible"

    Smalltalk
        at: #'MetacelloProject'
        ifAbsent: [ 
            | retry version error gofer |
            retry := false.
            (Array with: 'http://seaside.gemstone.com/ss/metacello' with: 'http://www.squeaksource.com/metacello')
                do: [ :repositoryUrl | 
                    [ 
                    "bootstrap Metacello"
                    self bootstrapMetacelloFrom: repositoryUrl.
                    version := (Smalltalk at: #'ConfigurationOfMetacello') project version: '1.0-beta.32'.	"bootstrap with 1.0-beta.32"
                    retry
                        ifTrue: [ 
                            "on retry, use #repositoryOverrides:"
                            version
                                repositoryOverrides:
                                    (Array with: (MCHttpRepository location: repositoryUrl user: '' password: '')) ].
                    version load: loadList.
                    gofer := (Smalltalk at: #'Gofer') new.
                    gofer
                        perform: #'gemsource:' with: 'metacello';
                        perform: #'package:' with: 'ConfigurationOfMetacelloPreview';
                        perform: #'load'.
                    version := (Smalltalk at: #'ConfigurationOfMetacelloPreview') project version: '1.0.0-beta.32.2'.	"load latest from GitHub"
                    version load: loadList.
                    ^ self ]
                        on: Error
                        do: [ :ex | 
                            error := ex.
                            Transcript
                                cr;
                                show: 'failed ensureMetacello: ';
                                show: ex description printString;
                                show: '...retrying'.	"try again"
                            retry := true.
                            ex return: nil ] ].	"shouldn't get here unless the load failed ... throw an error"
            self error: 'retry with alternate repository failed: ' , error description printString ]