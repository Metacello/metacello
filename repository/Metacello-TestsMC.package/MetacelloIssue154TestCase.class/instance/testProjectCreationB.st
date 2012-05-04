tests
testProjectCreationB
    | project projectReferenceSpec projectSpec x |
    project := MetacelloMCProject new.
    projectSpec := project projectSpec
        name: 'MetacelloExample';
        className: 'MetacelloExampleConfigurationClass';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        yourself.
    projectReferenceSpec := project projectReferenceSpec
        name: 'MetacelloExample';
        projectReference: projectSpec;
        versionString: '1.0';
        yourself.
    self
        assertMetacelloExampleProjectReferenceSpec: projectReferenceSpec
        projectName: 'MetacelloExample'
        className: 'MetacelloExampleConfigurationClass'
        packageName: 'MetacelloExampleConfigurationClass'
        fileName: 'MetacelloExampleConfigurationClass'.
    self
        assert:
            (x := projectReferenceSpec printString)
                =
                    'spec blessing: #''baseline''.
spec project: ''MetacelloExample'' with: [
		spec
			className: ''MetacelloExampleConfigurationClass'';
			versionString: ''1.0'';
			repository: ''dictionary://Metacello_Configuration_Test_Repository'' ].'