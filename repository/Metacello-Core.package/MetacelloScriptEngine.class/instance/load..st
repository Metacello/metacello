actions api
load: required
    [ 
    | version loadededSpec |
    version := (loadededSpec := self lookupProjectSpecFor: self projectSpec) versionForScriptEngine: self.
    self
        root:
            (required isEmpty
                ifTrue: [ version load ]
                ifFalse: [ version load: required ]).
    MetacelloProjectRegistration
        registerProjectSpec: loadededSpec
        ifPresent: [ :existing :new | MetacelloProjectRegistration mergeRegistration: existing with: new ] ]
        on: MetacelloLookupProjectSpec , MetacelloLookupProjectSpecForLoad , MetacelloProjectSpecLoadedNotification
        do: [ :ex | 
            (ex isKindOf: MetacelloLookupProjectSpec)
                ifTrue: [ ex resume: ((self lookupProjectSpecFor: ex projectSpec) ifNil: [ ^ ex resume: ex projectSpec ]) ].
            (ex isKindOf: MetacelloLookupProjectSpecForLoad)
                ifTrue: [ 
                    "don't look up currentVersion in image"
                    ex
                        resume:
                            (MetacelloProjectSpecForLoad new
                                projectSpec: ex projectSpec;
                                overrideProjectSpec: (self lookupProjectSpecFor: ex projectSpec);
                                yourself) ].
            (ex isKindOf: MetacelloProjectSpecLoadedNotification)
                ifTrue: [ 
                    | registration |
                    "This is when we should register the project spec, since this is the moment when the project has been successfully loaded"
                    registration := MetacelloProjectRegistration
                        registerProjectSpec: ex projectSpec
                        ifPresent: [ :existing :new | 
                            "unconditionally merge new with existing (updates registration"
                            MetacelloProjectRegistration mergeRegistration: existing with: new.
                            ex resume ].
                    ex resume ].
            self error: 'Unexpected exception'.
            ex pass ]