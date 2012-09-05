private
ensureMetacello: loadList
    "Bootstrap Metacello, retry using alternate repository, if primary repository is not accessible"

    Smalltalk
        at: #'MetacelloProject'
        ifAbsent: [ 
            | version error gofer |
            (Array with: 'http://seaside.gemstone.com/ss/metacello' with: 'http://www.squeaksource.com/metacello')
                do: [ :repositoryUrl | 
                    "bootstrap Metacello"
                    self bootstrapMetacelloFrom: repositoryUrl.
                    Smalltalk
                        at: #'ConfigurationOfMetacello'
                        ifAbsent: [ 
                            self
                                retry: [ 
                                    gofer := (Smalltalk at: #'Gofer') new.
                                    gofer
                                        perform: #'url:' with: repositoryUrl;
                                        perform: #'package:' with: 'ConfigurationOfMetacello';
                                        perform: #'load' ] ].
                    version := (Smalltalk at: #'ConfigurationOfMetacello') project version: '1.0-beta.32'.	"bootstrap with 1.0-beta.32"
                    version load: loadList.
                    self
                        retry: [ 
                            gofer := (Smalltalk at: #'Gofer') new.
                            Smalltalk
                                at: #'ConfigurationOfMetacelloPreview'
                                ifAbsent: [ 
                                    gofer
                                        perform: #'url:' with: repositoryUrl;
                                        perform: #'package:' with: 'ConfigurationOfMetacelloPreview';
                                        perform: #'load' ] ].
                    version := (Smalltalk at: #'ConfigurationOfMetacelloPreview') project version: '1.0.0-beta.32.2'.	"load latest from GitHub"
                    version load: loadList.
                    ^ self ].	"shouldn't get here unless the load failed ... throw an error"
            self error: 'retry with alternate repository failed: ' , error description printString ]