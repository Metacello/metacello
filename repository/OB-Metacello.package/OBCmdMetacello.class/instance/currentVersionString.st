private
currentVersionString

	| cv |
	^(cv := self currentVersion) == nil
		ifTrue: [ '' ]
		ifFalse: [ cv versionString ]