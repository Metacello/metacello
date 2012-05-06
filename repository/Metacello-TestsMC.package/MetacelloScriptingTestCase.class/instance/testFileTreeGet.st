tests
testFileTreeGet
    | version expected |
    Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , externalDirectory fullName;
        get.
    version := (Smalltalk at: #BaselineOfExternalX) project version.
    expected := 'spec 
	package: ''External-CoreX'';
	package: ''External-TestsX'' with: [
		spec requires: #(''External-CoreX'' ). ].
spec 
	group: ''Core'' with: #(''External-CoreX'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-TestsX'' ).'.
    self assert: version versionSpec printString = expected