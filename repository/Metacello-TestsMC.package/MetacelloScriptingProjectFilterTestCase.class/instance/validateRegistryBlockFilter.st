validation
validateRegistryBlockFilter
    | baselineList configurationList projectList |
    baselineList := Metacello registry
        baseline: [ :spec | true ];
        list.
    self assert: baselineList size = 3.
    baselineList
        do: [ :spec | self assert: (#('BaselineOfExternal' 'BaselineOfGithubRefIV' 'BaselineOfIssue32') includes: spec className) ].
    configurationList := Metacello registry
        configuration: [ :spec | true ];
        list.
    self assert: configurationList size = 2.
    configurationList
        do: [ :spec | self assert: (#('ConfigurationOfExternal' 'ConfigurationOfIssue32') includes: spec className) ].
    projectList := Metacello registry
        project: [ :spec | true ];
        list.
    self assert: projectList size = 5.
    projectList
        do: [ :spec | 
            self
                assert:
                    (#('ConfigurationOfExternal' 'BaselineOfExternal' 'BaselineOfGithubRefIV' 'ConfigurationOfIssue32' 'BaselineOfIssue32')
                        includes: spec className) ]