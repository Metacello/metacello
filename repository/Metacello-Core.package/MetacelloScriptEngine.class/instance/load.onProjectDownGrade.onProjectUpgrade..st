actions api
load: required onProjectDownGrade: onDownGradeBlock onProjectUpgrade: onUpgradeBlock
    MetacelloProjectRegistration
        copyRegistryRestoreOnErrorWhile: [ 
            self
                handleNotificationsForAction: [ 
                    | version loadedSpec |
                    self validateProjectSpecForScriptLoad.
                    [ loadedSpec := self lookupProjectSpecFor: self projectSpec ]
                        on: MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade
                        do: [ :ex | ex handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock ].
                    version := loadedSpec versionForScriptEngine: self.
                    self
                        root:
                            (required isEmpty
                                ifTrue: [ version load ]
                                ifFalse: [ version load: required ]) loadDirective.
                    loadedSpec loads: required.
                    MetacelloProjectRegistration
                        registrationForProjectSpec: loadedSpec
                        ifAbsent: [ :new | 
                            new
                                loadedInImage: true;
                                registerProject ]
                        ifPresent: [ :existing :new | 
                            existing
                                copyOnWrite: [ :existingCopy | 
                                    existingCopy
                                        loadedInImage: true;
                                        merge: new ] ] ] ]