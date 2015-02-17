tests
testVersionInfo
  | baselineVersionInfo vs |
  self
    assert:
      configurationProjectSpec asProjectRegistration versionInfo versionString = '1.0'.
  baselineVersionInfo := baselineProjectSpec asProjectRegistration versionInfo.
  self assert: baselineVersionInfo versionString isNil.
  vs := '0abcde'.
  baselineVersionInfo setVersionString: vs.
  self assert: baselineVersionInfo versionString = vs.
  baselineVersionInfo setVersionString: '111111'.
  self assert: baselineVersionInfo versionString = vs