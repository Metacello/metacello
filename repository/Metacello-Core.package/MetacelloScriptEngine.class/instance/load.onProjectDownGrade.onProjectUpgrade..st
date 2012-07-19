actions api
load: required onProjectDownGrade: onDownGradeBlock onProjectUpgrade: onUpgradeBlock
    self
        handleNotificationsForAction: [ 
            | version loadedSpec |
            self validateProjectSpec: #'validateForScriptLoad:'.
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
            (MetacelloProjectRegistration
                registerProjectSpec: loadedSpec
                ifPresent: [ :existing :new | MetacelloProjectRegistration mergeRegistration: existing with: new ])
                loadedInImage: true ]