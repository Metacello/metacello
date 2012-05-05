tests
testConstructor
    | version expected repo constructor |
    repo := MetacelloScriptingResource current externalRepository.
    Gofer new
        repository: repo;
        package: 'BaselineOfExternalX';
        load.
    version := (constructor := MetacelloBaselineConstructor on: (Smalltalk at: #BaselineOfExternalX)) project version.
    expected := 'spec 
	package: ''External-Core'';
	package: ''External-Tests'' with: [
		spec requires: #(''External-Core'' ). ].
spec 
	group: ''Core'' with: #(''External-Core'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-Tests'' ).'.
    self assert: version versionSpec printString = expected