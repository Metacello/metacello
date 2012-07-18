actions api
load: required onProjectDownGrade: onDownGradeBlock onProjectUpgrade: onUpgradeBlock onProjectLock: onLockBlock
    self
        handleNotificationsForAction: [ 
            | version loadedSpec |
            self validateProjectSpec: #'validateForScriptLoad:'.
            [ loadedSpec := self lookupProjectSpecFor: self projectSpec ]
                on:
                    MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade , MetacelloAllowLockedProjectModification
                do: [ :ex | ex handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock onLock: onLockBlock ].
            version := loadedSpec versionForScriptEngine: self.
            self
                root:
                    (required isEmpty
                        ifTrue: [ version load ]
                        ifFalse: [ version load: required ]) loadDirective.
            loadedSpec loads: required.
            (MetacelloProjectRegistration
                registerProjectSpec: loadedSpec
                ifPresent: [ :existing :new | MetacelloProjectRegistration mergeRegistration: existing with: new ])
                loadedInImage: true ]