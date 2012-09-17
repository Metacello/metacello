deploy
deploy: aVersionString from: sourceRepository
    ^ self deploy: aVersionString from: sourceRepository to: self deployRepositories