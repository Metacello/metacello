accessing
versionInfo
  versionInfo
    ifNil: [ 
      versionInfo := MetacelloProjectRegistrationVersionInfo new
        versionString: self version ].
  ^ versionInfo