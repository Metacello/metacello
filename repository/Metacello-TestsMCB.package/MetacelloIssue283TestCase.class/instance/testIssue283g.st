tests
testIssue283g
  "using Metacello Scripting API, the configuration is not auto-loaded ... unless an explicit get is issued."

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
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.2'.
  Metacello image
    configuration: 'ProjectIssue283';
    get.	"explicit get to load ConfigurationOfProjectIssue283-dkh.2"
  Metacello new
    configuration: 'ProjectConfigIssue283';
    version: '1.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.4'