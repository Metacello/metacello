accessing
merge: aProjectRegistration
  " ... merge is done when a spec has been loaded into the image"

  self shouldBeMutable.
  aProjectRegistration validate.
  self validate.
  aProjectRegistration configurationProjectSpec
    ifNotNilDo: [ :aSpec | 
      configurationProjectSpec := aSpec.
      baselineProjectSpec := nil.
      self versionInfo versionString: configurationProjectSpec versionString ]
    ifNil: [ 
      baselineProjectSpec := aProjectRegistration baselineProjectSpec.
      configurationProjectSpec := nil.
      self versionInfo
        versionString: baselineProjectSpec repositoryVersionString ]