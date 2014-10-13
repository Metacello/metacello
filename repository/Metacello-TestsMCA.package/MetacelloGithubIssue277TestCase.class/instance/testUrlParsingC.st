tests
testUrlParsingC
  | spec repo projectVersion version versionPattern |
  spec := {'github://dalehenrich/external:v1.*.*-gs/repository'.
  'github://dalehenrich/external:v1.*.*-gs/repository'.
  'dalehenrich/external'.
  'v1.*.*-gs'.
  'repository'}.
  repo := self validate: spec.
  projectVersion := repo projectVersion.
  (projectVersion beginsWith: 'v')
    ifTrue: [ 
      | versionString |
      versionString := projectVersion copyFrom: 2 to: projectVersion size.
      versionPattern := MetacelloSemanticVersionNumber
        fromString: versionString
        forPattern: true ].
  versionPattern inspect