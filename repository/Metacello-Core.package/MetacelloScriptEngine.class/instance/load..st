actions api
load: required
    [ 
    | version projectSpec registration |
    version := self version.
    projectSpec := version project projectSpec.
    projectSpec
        name: self projectName;
        versionString: version versionString;
        repository: self repositoryDescription;
        yourself.
    required notEmpty
        ifTrue: [ projectSpec loads: required ].
    registration := MetacelloProjectRegistration
        registerProjectSpec: projectSpec
        ifPresent: [ :existing :new | self halt ].
    Transcript
        cr;
        show:
                'Expicitly loaded version ' , registration versionString printString , ' or project '
                        , registration projectName printString.
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
                    | existing new |
                    existing := MetacelloProjectRegistration
                        registrationForProjectSpec: ex projectSpec
                        ifAbsent: [ ex resume: ex projectSpec ].
                    new := ex projectSpec asProjectRegistration.
                    (existing hasLoadConflicts: new)
                        ifFalse: [ ex resume: ex projectSpec ].
                    self halt.	"would have load conflict ... so this is where the rubber meets the road and we skip loading or not"
                    ex resume: ex projectSpec ].
            (ex isKindOf: MetacelloLoadProjectSpecVersionNotification)
                ifTrue: [ 
                    | registration |
                    registration := MetacelloProjectRegistration
                        registerProjectSpec: ex projectSpec
                        ifPresent: [ :existing :new | 
                            (existing hasLoadConflicts: new)
                                ifFalse: [ 
                                    existing merge: new.
                                    Transcript
                                        cr;
                                        show:
                                                'Loaded version ' , existing versionString printString , ' for ' , existing name printString.
                                    ex resume ].
                            self halt.	"we shouldn't really get here, unless we allowed the load to proceed during the lookup"
                            ex resume ] ].
            ex pass	"shouldn't get here" ]