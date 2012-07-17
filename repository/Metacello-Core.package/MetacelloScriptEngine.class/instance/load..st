actions api
load: required
    self
        handleNotificationsForAction: [ 
            | version loadedSpec |
            self validateProjectSpec: #'validateForScriptLoad:'.
            version := (loadedSpec := self lookupProjectSpecFor: self projectSpec) versionForScriptEngine: self.
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