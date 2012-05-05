tests
testExernalXXXa
    "#for:do: in spec#custom attribute not defined"

    | version expected repo constructor project |
    repo := MetacelloScriptingResource current externalRepository.
    Gofer new
        repository: repo;
        package: 'BaselineOfExternalXXX';
        load.
    project := MetacelloMCBaselineProject new
        projectAttributes: #();
        yourself.
    version := (constructor := MetacelloBaselineConstructor on: (Smalltalk at: #BaselineOfExternalXXX) project: project)
        project version.
    expected := 'spec 
	package: ''External-Core'';
	package: ''External-Tests'' with: [
		spec requires: #(''External-Core'' ). ].
spec 
	group: ''Core'' with: #(''External-Core'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-Tests'' ).'.
    self assert: version versionSpec printString = expected