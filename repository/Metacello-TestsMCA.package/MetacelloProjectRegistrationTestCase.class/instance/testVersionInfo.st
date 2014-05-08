tests
testVersionInfo
  self
    assert:
      baselineProjectSpec asProjectRegistration versionInfo versionString = 'baseline'.
  self
    assert:
      configurationProjectSpec asProjectRegistration versionInfo versionString = '1.0'