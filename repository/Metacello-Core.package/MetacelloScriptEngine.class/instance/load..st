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
    registration := MetacelloProjectRegistration registerProjectSpec: projectSpec ifPresent: [:existing :new | self halt].
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
                    self halt.	"this is wrong for MetacelloScriptingTestCase>>testFileTreeLoadConfiguration:
  we registered as loaded the ConfigurationOfExternalX and this call is for
  BaselineOfExternalX ... the real one and the one that should drive the load"
                    Transcript
                        cr;
                        show:
                                'Would have used version ' , existing versionString printString , ' for ' , existing projectName printString.
                    ex resume: ex projectSpec ].
            (ex isKindOf: MetacelloLoadProjectSpecVersionNotification)
                ifTrue: [ 
                    | registration |
                    registration := MetacelloProjectRegistration
                        registerProjectSpec: ex projectSpec
                        ifPresent: [ :existing :new | self halt ].
                    Transcript
                        cr;
                        show:
                                'Loaded version ' , ex projectSpec versionString printString , ' for ' , ex projectSpec name printString.
                    ex resume ].
            ex pass	"shouldn't get here" ]