tests
testIssue399F
	"https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231144979"

	"Issue399-Core package is in sampleRepository and externalRepository. BaselineOfIssue399 package is in external repository"

	"What happens when package loaded again? ... the fetch of the package is NOT skipped - cannot tell other than to look at the Transcript."

	"See https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231464884"

	Metacello new
		baseline: 'Issue399Cypress';
		repository: 'filetree://' , externalDirectory fullName;
		silently;
		load.
	self
		assert:
			(MetacelloPlatform current globalNamed: #Issue399Sample ifAbsent: [  ])
				isNil.
	self
		assert:
			(MetacelloPlatform current
				globalNamed: #Issue399External
				ifAbsent: [  ]) notNil.	"Confirm that package from external repo loaded"
	Metacello new
		baseline: 'Issue399Cypress';
		repository: 'filetree://' , externalDirectory fullName;
		silently;
		load.
	self
		assert:
			(MetacelloPlatform current globalNamed: #Issue399Sample ifAbsent: [  ])
				isNil.
	self
		assert:
			(MetacelloPlatform current
				globalNamed: #Issue399External
				ifAbsent: [  ]) notNil	"Confirm that package from external repo loaded"