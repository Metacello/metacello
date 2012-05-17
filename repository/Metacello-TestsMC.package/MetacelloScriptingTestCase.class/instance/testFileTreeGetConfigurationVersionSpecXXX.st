tests
testFileTreeGetConfigurationVersionSpecXXX
    "resolve to BaselineOf ... use spec or versionSpec"

    | project versionSpec expected |
    project := Metacello new
        project: 'ExternalXXX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec.
    expected := 'spec repository: ''github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository''.
spec 
	package: ''External-Core'';
	package: ''External-Tests'' with: [
		spec requires: #(''External-Core'' ). ].
spec 
	group: ''Core'' with: #(''External-Core'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-Tests'' ).'.
    self assert: versionSpec printString = expected