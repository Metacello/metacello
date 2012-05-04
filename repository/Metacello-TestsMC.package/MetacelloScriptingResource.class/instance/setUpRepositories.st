running
setUpRepositories
    "This method builds a fake repository with the version references from #buildReferences."

    "self reset"

    externalRepository := MCDictionaryRepository new.
    sampleRepository := MCDictionaryRepository new