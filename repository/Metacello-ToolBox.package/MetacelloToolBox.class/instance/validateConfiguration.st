validation
validateConfiguration
	| issues |
	issues := (MetacelloMCVersionValidator validateConfiguration: project configuration class recurse: false)
		select: [ :issue | issue isCritical ].
	issues notEmpty
		ifTrue: [ self error: 'There are critical issues in the configuration']