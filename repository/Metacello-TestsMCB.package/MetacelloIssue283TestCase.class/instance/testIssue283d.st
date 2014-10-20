tests
testIssue283d
  "https://github.com/dalehenrich/metacello-work/issues/283"

  | project wc |
  gofer version: 'ConfigurationOfProjectIssue283-dkh.2'.
  gofer metacelloLoad.
  project := (Smalltalk at: #'ConfigurationOfProjectIssue283') project.
  (project version: #'stable') load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.4'