actions api
load: required
    [ 
    | version projectSpec |
    version := self version.
    projectSpec := version project projectSpec.
    projectSpec
        name: self projectName;
        versionString: version versionString;
        repository: self repositoryDescription;
        yourself.
    required notEmpty
        ifTrue: [ projectSpec loads: required ].
    self loadedProjects at: self projectName put: projectSpec.
    Transcript
        cr;
        show:
                'Expicitly loaded version ' , version versionString printString , ' or project ' , projectSpec name printString.
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
                    | loadedProjectspec |
                    loadedProjectspec := self loadedProjects
                        at: ex projectSpec name
                        ifAbsent: [ ex resume: ex projectSpec ].	"this is wrong for MetacelloScriptingTestCase>>testFileTreeLoadConfiguration:
  we registered as loaded the ConfigurationOfExternalX and this call is for
  BaselineOfExternalX ... the real one and the one that should drive the load"
                    self halt.
                    Transcript
                        cr;
                        show:
                                'Would have used version ' , loadedProjectspec versionString printString , ' for ' , loadedProjectspec name printString.
                    ex resume: ex projectSpec ].
            (ex isKindOf: MetacelloLoadProjectSpecVersionNotification)
                ifTrue: [ 
                    | ar |
                    self halt loadedProjects at: ex projectSpec name put: ex projectSpec copy.
                    Transcript
                        cr;
                        show:
                                'Loaded version ' , ex projectSpec versionString printString , ' for ' , ex projectSpec name printString.
                    ex resume ].
            ex pass	"shouldn't get here" ]