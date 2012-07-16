validation
validateImageBlockFilter
    | baselineList configurationList projectList |
    baselineList := Metacello image
        baseline: [ :spec | true ];
        list.
    self assert: baselineList size = 2.
    baselineList do: [ :spec | self assert: (#('BaselineOfExternal' 'BaselineOfGithubRefIV') includes: spec className) ].
    configurationList := Metacello image
        configuration: [ :spec | true ];
        list.
    self assert: configurationList size = 1.
    configurationList do: [ :spec | self assert: (#('ConfigurationOfExternal') includes: spec className) ].
    projectList := Metacello image
        project: [ :spec | true ];
        list.
    self assert: projectList size = 3.
    projectList
        do: [ :spec | self assert: (#('ConfigurationOfExternal' 'BaselineOfExternal' 'BaselineOfGithubRefIV') includes: spec className) ]