actions api
get
  " load a fresh copy from repo"

  | spec projectPackage |
  MetacelloProjectRegistration
    copyRegistryRestoreOnErrorWhile: [ 
      | rootProject |
      self setDefaultsAndValidateProjectSpec.
      spec := self projectSpec.
      rootProject := (MetacelloPlatform current
        globalNamed: spec className asSymbol) project.
      spec := spec copyAsConformingProjectSpec: rootProject.
      projectPackage := spec projectPackage.
      projectPackage repositorySpecs
        do: [ :repoSpec | repoSpec createRepository flushForScriptGet ].
      self cacheRepository
        ifNotNil: [ :cacheRepository | projectPackage loader loaderPolicy cacheRepository: cacheRepository ].
      projectPackage load.
      self root: rootProject.
      MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :new | new registerProject ]
        ifPresent: [ :existing :new | 
          existing
            copyOnWrite: [ :existingCopy | 
              spec
                copyForRegistration: existingCopy
                onWrite: [ :specCopy | 
                  specCopy
                    ifNil: [ existingCopy merge: new ]
                    ifNotNil: [ specCopy mergeScriptRepository: spec ] ] ] ] ]