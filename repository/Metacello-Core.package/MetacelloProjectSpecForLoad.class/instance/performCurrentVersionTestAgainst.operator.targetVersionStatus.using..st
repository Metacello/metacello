operations
performCurrentVersionTestAgainst: vrsn operator: anOperator targetVersionStatus: targetVersionStatus using: anMCLoader
  "answer true if the current state of image is to be left as is"

  | loadedVersion existing new |
  vrsn ifNil: [ ^ false ].
  self useDetermineVersionForLoad
    ifTrue: [ 
      | prjct cv |
      self hasOverride
        ifTrue: [ 
          self
            error:
              'unexpected logic combination: useDeterminVersionForLoad & hasOverride' ].
      prjct := self projectSpec projectClassProject.
      prjct loader: anMCLoader.
      (cv := prjct currentVersion) == nil
        ifTrue: [ ^ false ].
      (targetVersionStatus includes: cv versionStatus)
        ifTrue: [ ^ cv perform: anOperator with: vrsn ].
      ^ false ].
  self hasLoaded not
    ifTrue: [ 
      "the project is not currently loaded"
      ^ false ].
  (self hasOverride not or: [ targetVersionStatus ~= #(#'allLoadedToSpec') ])
    ifTrue: [ 
      "load the specified project"
      ^ false ].
  (self overrideProjectSpec allPackagesLoaded: anMCLoader)
    ifFalse: [ 
      "roughly equivalent to versionStatus test above (#'allLoadedToSpec')"
      ^ false ].
  (self overrideProjectSpec
    isPartiallyLoaded: self overrideProjectSpec copy loader)
    ifFalse: [ 
      "if the project is not loaded at all"
      ^ false ].
  (loadedVersion := self loadedProjectSpec versionOrNil) ifNil: [ ^ false ].
  loadedVersion = vrsn
    ifTrue: [ 
      "same version but are they equal"
      ^ self loadedProjectSpec compareEqual: self overrideProjectSpec ].
  existing := self loadedProjectSpec asProjectRegistration.
  new := self projectSpec asProjectRegistration.
  ^ loadedVersion > vrsn
    ifTrue: [ 
      "answer false if downgrade allowed"
      ^ (MetacelloAllowProjectDowngrade new
        existingProjectRegistration: existing;
        newProjectRegistration: new;
        signal) == existing ]
    ifFalse: [ 
      "answer false if upgrade allowed"
      (MetacelloAllowProjectUpgrade new
        existingProjectRegistration: existing;
        newProjectRegistration: new;
        signal) == existing ]