mc support
updateRepository: aRepository

	(aRepository respondsTo: #username:) ifTrue: [
		aRepository username: self username].
	(aRepository respondsTo: #password:) ifTrue: [
		aRepository password: self password].
	^ aRepository