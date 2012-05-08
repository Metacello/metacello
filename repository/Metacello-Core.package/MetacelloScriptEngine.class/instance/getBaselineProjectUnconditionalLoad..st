project lookup
getBaselineProjectUnconditionalLoad: unconditionalLoad
    | project |
    project := (self getBaselineUnconditionalLoad: unconditionalLoad) project.
    project version spec repository: self repositorySpec description.
    ^ project