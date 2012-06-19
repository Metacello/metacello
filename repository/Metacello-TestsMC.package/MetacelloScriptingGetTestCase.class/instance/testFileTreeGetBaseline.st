tests
testFileTreeGetBaseline
    | project versionSpec expected |
    project := Metacello new
        baseline: 'ExternalX';
        repository: 'filetree://' , externalDirectory fullName;
        get.
    versionSpec := project version versionSpec.
    self assert: (versionSpec repositorySpecs first description endsWith: self externalPath).
    versionSpec repositories: nil.	"full path to disk-based repository varies from platform to platform"
    expected := 'spec description: ''MetacelloScriptingResource>>externalBaselineX:''.
spec 
	package: ''External-CoreX'';
	package: ''External-TestsX'' with: [
		spec requires: #(''External-CoreX'' ). ].
spec 
	group: ''Core'' with: #(''External-CoreX'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-TestsX'' ).'.
    self assert: versionSpec printString = expected