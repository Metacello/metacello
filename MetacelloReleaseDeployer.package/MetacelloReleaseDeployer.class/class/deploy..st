deploy
deploy: aVersionString
    "self deploy: '1.0-beta.31.1.5'"

    ^ self deploy: aVersionString from: self sourceRepository