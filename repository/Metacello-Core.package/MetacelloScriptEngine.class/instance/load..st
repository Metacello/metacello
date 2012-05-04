actions api
load: required
    [ 
    | version projectSpec basicVersionString |
    version := self projectClass versionFrom: self.
    projectSpec := version project projectSpec.
    projectSpec
        name: self projectName;
        versionString: self versionString;
        repository: self repositoryDescription;
        yourself.
    required notEmpty
        ifTrue: [ projectSpec loads: required ].
    basicVersionString := projectSpec basicVersionString.
    self loadedProjects
        at: projectSpec name
        put:
            {projectSpec.
            basicVersionString}.
    Transcript
        cr;
        show: 'Expicitly loaded version ' , basicVersionString printString , ' for ' , projectSpec name printString.
    self
        root:
            (required isEmpty
                ifTrue: [ version load ]
                ifFalse: [ version load: required ]) ]
        on:
            MetacelloLookupConfigurationPackageSpecNotification , MetacelloLoadProjectSpecVersionNotification
                , MetacelloLookupProjectSpecNotification
        do: [ :ex | 
            (ex isKindOf: MetacelloLookupConfigurationPackageSpecNotification)
                ifTrue: [ ex resume: ((self lookupConfigurationPackageSpecFrom: ex packageSpec) ifNil: [ ^ ex resume: ex packageSpec ]) ].
            (ex isKindOf: MetacelloLookupProjectSpecNotification)
                ifTrue: [ 
                    | ar |
                    ar := self loadedProjects at: ex projectSpec name ifAbsent: [ ex resume: ex projectSpec ].
                    Transcript
                        cr;
                        show:
                                'Would have used version ' , (ar at: 2) printString , ' for ' , (ar at: 1) name printString.
                    ex resume: ex projectSpec ].
            (ex isKindOf: MetacelloLoadProjectSpecVersionNotification)
                ifTrue: [ 
                    | ar |
                    self loadedProjects
                        at: ex projectSpec name
                        put:
                            (ar := {(ex projectSpec).
                            (ex versionString)}).
                    Transcript
                        cr;
                        show: 'Loaded version ' , (ar at: 2) printString , ' for ' , (ar at: 1) name printString.
                    ex resume ].
            ex pass	"shouldn't get here" ]