tests
testIssue206e
	"https://github.com/dalehenrich/metacello-work/issues/206"

	| project wc |
	gofer version: 'ConfigurationOfProjectIssue283-dkh.1'.
	gofer metacelloLoad.
	gofer version: 'ConfigurationOfProjectConfigIssue283-dkh.1'.
	gofer metacelloLoad.
	project := (MetacelloPlatform current
		globalNamed: #ConfigurationOfProjectConfigIssue283) project.
	(project version: '2.0') load.	"#bleedingEdge"
	wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
	self assert: wc ancestry ancestors first name = 'GoferFoo-lr.4'