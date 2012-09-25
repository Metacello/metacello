validation
validateRegistryCollectionFilter
    | baselineList configurationList projectList |
    baselineList := Metacello registry
        baseline: #('Issue32' 'External');
        list.
    self assert: baselineList size = 1.
    baselineList do: [ :spec | self assert: (#('BaselineOfIssue32' 'BaselineOfExternal') includes: spec className) ].
    configurationList := Metacello registry
        configuration: #('Issue32' 'External');
        list.
    self assert: configurationList size = 1.
    configurationList
        do: [ :spec | self assert: (#('ConfigurationOfIssue32' 'ConfigurationOfExternal') includes: spec className) ].
    projectList := Metacello registry
        project: #('Issue32' 'External');
        list.
    self assert: projectList size = 2.
    projectList
        do: [ :spec | 
            self
                assert:
                    (#('ConfigurationOfIssue32' 'BaselineOfIssue32' 'ConfigurationOfExternal' 'BaselineOfExternal') includes: spec className) ]