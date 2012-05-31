actions api
load: required
    [ 
    | version theProjectSpec registration |
    theProjectSpec := self projectSpec.
    required notEmpty
        ifTrue: [ theProjectSpec loads: required ].
    registration := MetacelloProjectRegistration
        registerProjectSpec: theProjectSpec
        ifPresent: [ :existing :new | 
            (existing hasLoadConflicts: new)
                ifTrue: [ 
                    (existing canUpgradeTo: new)
                        ifTrue: [ 
                            self upgradesAllowed
                                ifTrue: [ 
                                    Transcript
                                        cr;
                                        show:
                                                'Upgrading to version ' , new versionString printString , ' for project ' , new projectName printString.
                                    MetacelloProjectRegistration registerProjectRegistration: new ]
                                ifFalse: [ 
                                    MetacelloSkippedProjectSpecLoadUpgradeNotAllowedNotification new
                                        existingProjectRegistration: existing;
                                        newProjectRegistration: new;
                                        signal ] ]
                        ifFalse: [ 
                            MetacelloSkippedProjectSpecLoadConflictsNotification new
                                existingProjectRegistration: existing;
                                newProjectRegistration: new;
                                signal ] ] ].
    version := registration version.
    version ifNil: [ self halt ].
    Transcript
        cr;
        show:
                'Expicitly loaded version ' , registration versionString printString , ' for project '
                        , registration projectName printString.
    self
        root:
            (required isEmpty
                ifTrue: [ version load ]
                ifFalse: [ version load: required ]) ]
        on:
            MetacelloLookupConfigurationProjectSpecNotification , MetacelloLoadProjectSpecVersionNotification
                , MetacelloLookupProjectSpecNotification
        do: [ :ex | 
            (ex isKindOf: MetacelloLookupConfigurationProjectSpecNotification)
                ifTrue: [ ex resume: ((self lookupConfigurationProjectSpecFrom: ex projectSpec) ifNil: [ ^ ex resume: ex projectSpec ]) ].
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