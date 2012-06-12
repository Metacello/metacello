accessing
externalConfigurationSHA
    "SHA of commit on 'configuration' branch that should be used with this version of tests"

    "it's too dangerous to use the HEAD of a branch in tests, because over time the HEAD will change to match latest testing needs, but old tests will likely break"

    "self reset"

    ^ '7a8ac9c368d42d6828358a06fe61c9e466235239'