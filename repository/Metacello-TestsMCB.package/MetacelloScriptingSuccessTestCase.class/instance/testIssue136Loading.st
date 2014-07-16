tests
testIssue136Loading
  "https://github.com/dalehenrich/metacello-work/issues/136"

  "already baseline should have precedence over one being requested during load of different package. Both
          BaselineOfGithubRefVII --> MetacelloScriptingResource>>baselineGithubReferenceIV:
          BaselineOfGithubRefVIII --> MetacelloScriptingResource>>baselineGithubReferenceV:
       reference the External project, but each reference is for a different repository:
          BaselineOfGithubRefVII -->  MetacelloScriptingResource>>baselineGithubReferenceIV: --> http://ss3.gemstone.com/ss/external
          BaselineOfGithubRefVIII --> MetacelloScriptingResource>>baselineGithubReferenceV: --> github://dalehenrich/external:XXXXXXXXX/repository
      the first one loaded (BaselineOfGithubRefVII) should win
	 "

  | conflictSeen upgradeSeen |
  Metacello new
    baseline: 'GithubRefVII';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    validateExpectedConfigurationClassName: nil
    expectedConfigurationVersion: nil
    expectedConfigurationRepository: nil
    expectedBaselineClassName: 'BaselineOfExternal'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository: 'http://ss3.gemtalksystems.com/ss/external'.
  upgradeSeen := conflictSeen := false.
  Metacello new
    baseline: 'GithubRefVIII';
    repository: 'filetree://' , externalDirectory fullName;
    onConflict: [ :ex | 
          ex existingProjectRegistration projectName = 'External'
            ifTrue: [ 
              conflictSeen := true.
              ex disallow ].
          ex pass ];
    onUpgrade: [ :ex | 
          upgradeSeen := true.
          ex existingProjectRegistration projectName = 'External'
            ifTrue: [ ex allow ].
          ex pass ];
    silently;
    load.
  self assert: conflictSeen.
  self deny: upgradeSeen.
  self
    validateExpectedConfigurationClassName: nil
    expectedConfigurationVersion: nil
    expectedConfigurationRepository: nil
    expectedBaselineClassName: 'BaselineOfExternal'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository: 'http://ss3.gemtalksystems.com/ss/external'