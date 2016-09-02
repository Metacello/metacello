tests project spec
testGithubRefIX
  "project:with:"

  | version expected repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefIX';
    load.
  version := (Metacello current globalNamed: #'BaselineOfGithubRefIX') project
    version.
  expected := 'spec description: ''MetacelloScriptingResource>>configurationGithubReferenceIV:''.
spec project: ''External'' with: [
		spec
			className: ''ConfigurationOfExternal'';
			versionString: ''0.9.0'';
			repository: ''github://dalehenrich/external:'
    , MetacelloScriptingResource externalConfigurationSHA , '/repository'' ].'.
  self assert: version versionSpec printString = expected