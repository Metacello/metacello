tests
testConstructor
	| version expected repo |
	repo := MetacelloScriptingResource current externalRepository.
	Gofer new
		repository: repo;
		package: 'BaselineOfExternalX';
		load.
	version := (MetacelloBaselineConstructor on: (Smalltalk at: #BaselineOfExternalX)) root.
	expected := 'spec 
	package: ''External-Core'';
	package: ''External-Tests'' with: [
		spec requires: #(''External-Core'' ). ].
spec 
	group: ''Core'' with: #(''External-Core'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-Tests'' ).'.
	self assert: version printString = expected