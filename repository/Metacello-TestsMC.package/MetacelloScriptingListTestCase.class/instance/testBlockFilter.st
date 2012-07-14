tests
testBlockFilter
    | baselineList configurationList projectList |
    Metacello new
        baseline: 'GithubRefIV';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    baselineList := Metacello registry
        baseline: [ :spec | true ];
        list.
    self assert: baselineList size = 2.
    baselineList do: [ :spec | self assert: (#('BaselineOfExternal' 'BaselineOfGithubRefIV') includes: spec className) ].
    configurationList := Metacello registry
        configuration: [ :spec | true ];
        list.
    self assert: configurationList size = 1.
    configurationList do: [ :spec | self assert: (#('ConfigurationOfExternal') includes: spec className) ].
    projectList := Metacello registry
        project: [ :spec | true ];
        list.
    self assert: projectList size = 3.
    projectList
        do: [ :spec | self assert: (#('ConfigurationOfExternal' 'BaselineOfExternal' 'BaselineOfGithubRefIV') includes: spec className) ]