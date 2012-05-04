private
promptForBaselineVersion: message

	| versions labels |
	versions := self reversedVersions select: [:vrsn | vrsn blessing == #baseline ].
	labels := versions collect: [:vrsn |vrsn versionString ].
	^OBChoiceRequest prompt: message labels: labels values: versions
