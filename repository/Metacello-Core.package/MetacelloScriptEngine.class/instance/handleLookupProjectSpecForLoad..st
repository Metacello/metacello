handlers
handleLookupProjectSpecForLoad: exception
  "if overrideProjectSpec is nil, use currentVersion in image, ignoreImage is false"

  | requested override loaded |
  requested := exception projectSpec.
  loaded := nil.
  self useCurrentVersion
    ifTrue: [ 
      "don't do lookup in registry if we expect to use the #currentVersion calculation"
      override := nil ]
    ifFalse: [ 
      self
        lookupRegistrationFor: exception projectSpec
        isAbsent: [ :new |  ]
        isExisting: [ :existing :new | 
          existing loadedInImage
            ifTrue: [ loaded := existing projectSpec ] ]
        isConflict: [ :existing :new :chosen | 
          "counts as overrided if existing not chosen"
          new == chosen
            ifTrue: [ override := chosen projectSpec ].
          existing loadedInImage
            ifTrue: [ loaded := existing projectSpec ] ] ].
  ^ exception
    resume:
      (MetacelloProjectSpecForLoad new
        projectSpec: requested;
        useDetermineVersionForLoad: self useCurrentVersion;
        overrideProjectSpec: override;
        loadedProjectSpec: loaded;
        yourself)