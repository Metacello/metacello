testing
testDeploy: aVersionString
    "self testDeploy: '1.0-beta.31.1.5'"

    ^ self deploy: aVersionString from: self sourceRepository to: self testDeployRepositories inspect