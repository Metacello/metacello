tests
testGetBaseline
  | projectSpecs expected x |
  Metacello new
    baseline: 'ExternalX';
    repository: 'filetree://' , externalDirectory fullName;
    get.
  projectSpecs := Metacello registry
    baseline: 'ExternalX';
    list.
  expected := 'spec 
	name: ''ExternalX'';
	repository: ''filetree://'
    , externalDirectory fullName , '''.'.
  self assert: projectSpecs size = 1.
  self assert: (x := projectSpecs first printString) = expected