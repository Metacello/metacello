actions api
get
    " load a fresh copy from repo"

    | spec |
    spec := self projectSpec.
    spec projectPackage load.
    self root: (Smalltalk at: spec className asSymbol) project.
    MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :new | new registerProject ]
        ifPresent: [ :existing :new | 
            (spec lookupProjectSpecIn: existing)
                ifNil: [ MetacelloProjectRegistration mergeRegistration: existing with: new ]
                ifNotNil: [ :existingSpec | existingSpec mergeScriptRepository: spec ] ]