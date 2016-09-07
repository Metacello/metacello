tests
testIssue283f
  "using Metacello Scripting API, the configuration is not auto-loaded"

  "https://github.com/dalehenrich/metacello-work/issues/283"

  | project wc |
  gofer version: 'ConfigurationOfProjectIssue283-dkh.1'.
  gofer metacelloLoad.
  Metacello new
    configuration: 'ProjectConfigIssue283';
    version: '1.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.2'