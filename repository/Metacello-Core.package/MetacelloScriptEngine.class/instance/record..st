actions api
record: required
    MetacelloProjectRegistration
        copyRegistryWhile: [ 
            self
                handleNotificationsForAction: [ 
                    | version loadedSpec |
                    self validateProjectSpecForScript.
                    [ loadedSpec := self lookupProjectSpecFor: self projectSpec ]
                        on: MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade
                        do: [ :notification | 
                            notification
                                handleOnDownGrade: [ :ex :existing :new | ex allowEvenIfLocked ]
                                onUpgrade: [ :ex :existing :new | ex allowEvenIfLocked ] ].
                    version := loadedSpec versionForScriptEngine: self.
                    self
                        root:
                            (required isEmpty
                                ifTrue: [ version record ]
                                ifFalse: [ version record: required ]) loadDirective ] ]