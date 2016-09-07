tests
testIssue206f
  "https://github.com/dalehenrich/metacello-work/issues/206"

  | project wc |
  gofer version: 'ConfigurationOfProjectIssue283-dkh.1'.
  gofer metacelloLoad.
  Metacello new
    configuration: 'ProjectConfigIssue283';
    version: '2.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.2'