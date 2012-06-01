actions api
load: required
    [ 
    | version registration |
    registration := MetacelloProjectRegistration
        registerProjectSpec: self projectSpec
        ifPresent: [ :existing :new | 
            (existing hasLoadConflicts: new)
                ifTrue: [ 
                    (existing canUpgradeTo: new)
                        ifTrue: [ 
                            self upgradesAllowed
                                ifTrue: [ MetacelloProjectRegistration registerProjectRegistration: new ]
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
    version := (self projectSpec lookupProjectSpecIn: registration) versionForScriptEngine: self.
    version ifNil: [ self halt ].
    self
        root:
            (required isEmpty
                ifTrue: [ version load ]
                ifFalse: [ version load: required ]) ]
        on: MetacelloLookupProjectSpec , MetacelloLookupProjectSpecForLoad , MetacelloProjectSpecLoadedNotification
        do: [ :ex | 
            (ex isKindOf: MetacelloLookupProjectSpec)
                ifTrue: [ ex resume: ((self lookupConfigurationProjectSpecFrom: ex projectSpec) ifNil: [ ^ ex resume: ex projectSpec ]) ].
            (ex isKindOf: MetacelloLookupProjectSpecForLoad)
                ifTrue: [ 
                    | spec specForLoad existing new |
                    "this logic should end up being very similar to lookupConfigurationProjectSpecFrom: ...."
                    spec := ex projectSpec.
                    specForLoad := MetacelloProjectSpecForLoad new
                        projectSpec: spec;
                        yourself.
                    existing := MetacelloProjectRegistration
                        registrationForProjectSpec: spec
                        ifAbsent: [ ^ ex resume: specForLoad ].
                    (existing hasLoadConflicts: (new := spec asProjectRegistration))
                        ifTrue: [ 
                            "would have load conflict ... so this is where the rubber meets the road and we skip loading or not"
                            self halt ]
                        ifFalse: [ 
                            "do not check image for currentVersion"
                            specForLoad overrideProjectSpec: (self projectSpec lookupProjectSpecIn: new) ].
                    ex resume: specForLoad ].
            (ex isKindOf: MetacelloProjectSpecLoadedNotification)
                ifTrue: [ 
                    | registration |
                    "This is when we should register the project spec, since this is the moment when the project has been successfully loaded"
                    registration := MetacelloProjectRegistration
                        registerProjectSpec: ex projectSpec
                        ifPresent: [ :existing :new | 
                            (existing hasLoadConflicts: new)
                                ifFalse: [ 
                                    MetacelloProjectRegistration mergeRegistration: existing with: new.
                                    ex resume ].
                            self halt.	"we shouldn't really get here, unless we allowed the load to proceed during the lookup"
                            ex resume ] ].
            ex pass	"shouldn't get here" ]