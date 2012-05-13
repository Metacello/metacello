accessing
repositorySpec
    repositorySpec == nil
        ifTrue: [ repositorySpec := self project repositorySpec ].
    ^ repositorySpec