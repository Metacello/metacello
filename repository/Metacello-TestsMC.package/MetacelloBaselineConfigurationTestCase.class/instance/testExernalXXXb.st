tests
testExernalXXXb
    "#for:do: in spec. #custom attribute defined"

    | version expected repo constructor project |
    repo := MetacelloScriptingResource current externalRepository.
    Gofer new
        repository: repo;
        package: 'BaselineOfExternalXXX';
        load.
    project := MetacelloMCBaselineProject new
        projectAttributes: #(#custom);
        yourself.
    version := (constructor := MetacelloBaselineConstructor on: (Smalltalk at: #BaselineOfExternalXXX) project: project)
        project version.
    expected := 'spec 
	package: ''External-Core'';
	package: ''External-Tests'' with: [
		spec requires: #(''External-Core'' ). ];
	package: ''External-UI''.
spec 
	group: ''Core'' with: #(''External-Core'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-Tests'' );
	group: ''UI'' with: #(''External-UI'' ).'.
    self assert: version versionSpec printString = expected