tests
testIssue206b
	"https://github.com/dalehenrich/metacello-work/issues/206"

	| project wc |
	gofer version: 'ConfigurationOfProjectIssue283-dkh.1'.
	gofer metacelloLoad.
	project := (MetacelloPlatform current
		globalNamed: #ConfigurationOfProjectIssue283) project.
	(project version: #bleedingEdge) load.
	wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
	self assert: wc ancestry ancestors first name = 'GoferFoo-lr.2'