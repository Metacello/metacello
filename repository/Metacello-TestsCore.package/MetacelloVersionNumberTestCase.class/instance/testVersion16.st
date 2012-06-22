tests
testVersion16
    super testVersion16.
    self assert: (self versionClass fromString: '1.0-beta.0') < (self versionClass fromString: '1.0.0.0')