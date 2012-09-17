testing
testRelease: aVersionString
    "self testRelease: '1.0-beta.31.1.5'"

    ^ self release: aVersionString from: self sourceRepository to: self testReleaseRepositories inspect