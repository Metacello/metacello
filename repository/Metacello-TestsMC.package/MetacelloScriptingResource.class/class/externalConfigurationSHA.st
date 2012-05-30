accessing
externalConfigurationSHA
    "SHA of commit on 'configuration' branch that should be used with this version of tests"

    "it's too dangerous to use the HEAD of a branch in tests, because over time the HEAD will change to match latest testing needs, but old tests will likely break"

    "self reset"

    ^ 'acf4ebe6016276cc2c7e51a2b773fa4459670d5e'