actions api
load: required
    self
        handleNotificationsForAction: [ 
            | version loadededSpec |
            self validateProjectSpec: #'validateForScriptLoad:'.
            version := (loadededSpec := self lookupProjectSpecFor: self projectSpec) versionForScriptEngine: self.
            self
                root:
                    (required isEmpty
                        ifTrue: [ version load ]
                        ifFalse: [ version load: required ]) loadDirective.
            MetacelloProjectRegistration
                registerProjectSpec: loadededSpec
                ifPresent: [ :existing :new | MetacelloProjectRegistration mergeRegistration: existing with: new ] ]