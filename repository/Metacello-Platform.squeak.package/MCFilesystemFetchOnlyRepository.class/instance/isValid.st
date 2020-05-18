testing
isValid
    ^ repositoryReader ifNotNil: [self repositoryReader isValid] ifNil: [false]