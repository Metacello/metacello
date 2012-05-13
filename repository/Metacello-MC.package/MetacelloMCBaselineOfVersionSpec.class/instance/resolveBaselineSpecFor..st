accessing
resolveBaselineSpecFor: aMetacelloVersion
    "resolve BaselineOf and replace the spec with the spec with the versionSpec from the baseline"

    | baselineProject |
    baselineProject := Metacello new
        project: self baselineBaseName;
        repository: self repositorySpec description;
        getBaseline.
    aMetacelloVersion spec: baselineProject version versionSpec