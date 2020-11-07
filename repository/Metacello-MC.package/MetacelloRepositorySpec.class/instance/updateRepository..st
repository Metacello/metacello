mc support
updateRepository: aRepository

    (self username notNil and: [self username notEmpty]) ifTrue: [
        aRepository username: self username].
	(self password notNil and: [self password notEmpty]) ifTrue: [
        aRepository password: self password].
	^ aRepository