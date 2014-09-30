tests
testIssue283e
  "https://github.com/dalehenrich/metacello-work/issues/283"

  | project wc |
  gofer version: 'ConfigurationOfProjectIssue283-dkh.1'.
  gofer metacelloLoad.
  gofer version: 'ConfigurationOfProjectConfigIssue283-dkh.1'.
  gofer metacelloLoad.
  project := (Smalltalk at: #'ConfigurationOfProjectConfigIssue283') project.
  (project version: '1.0') load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.4'