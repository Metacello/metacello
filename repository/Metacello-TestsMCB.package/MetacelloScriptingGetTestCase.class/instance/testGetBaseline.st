tests
testGetBaseline
  | projectSpecs expected |
  Metacello new
    baseline: 'ExternalX';
    repository: 'filetree://' , externalDirectory fullName;
    get.
  projectSpecs := Metacello registry
    baseline: 'ExternalX';
    list.
  expected := 'spec 
	name: ''ExternalX'';
	versionString: ''baseline'';
	repository: ''filetree://'
    , externalDirectory fullName , '''.'.
  self assert: projectSpecs size = 1.
  self assert: projectSpecs first printString = expected