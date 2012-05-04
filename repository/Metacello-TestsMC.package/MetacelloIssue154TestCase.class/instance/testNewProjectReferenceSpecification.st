tests
testNewProjectReferenceSpecification
    | project versionSpec validations x |
    gofer version: 'ConfigurationOfMetacelloProjectIssue154-dkh.1'.
    gofer metacelloLoad.
    project := self project.
    versionSpec := (project version: '3.0-baseline') spec.
    validations := MetacelloToolBox validateConfiguration: self projectClass.
    self assert: validations size = 1.
    validations detect: [ :validation | validation reasonCode == #'onlyBaselineVersion' ] ifNone: [ self assert: false ].
    self assertMetacelloExampleVersionSpec: versionSpec.
    self assert: (x := versionSpec printString) = ''