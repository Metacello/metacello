tests
testExernalXX
  "#for:do: in spec"

  | version expected repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfExternalXX';
    load.
  version := (Metacello current globalNamed: #'BaselineOfExternalXX') project
    version.
  expected := 'spec description: ''MetacelloScriptingResource>>externalBaselineXX:''.
spec 
	package: ''External-CoreX'';
	package: ''External-TestsX'' with: [
		spec requires: #(''External-CoreX'' ). ].
spec 
	group: ''Core'' with: #(''External-CoreX'' );
	group: ''default'' with: #(''Core'' );
	group: ''Tests'' with: #(''External-TestsX'' ).'.
  self assert: version versionSpec printString = expected