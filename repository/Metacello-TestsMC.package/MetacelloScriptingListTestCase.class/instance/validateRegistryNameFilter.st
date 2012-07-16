validation
validateRegistryNameFilter
    | baselineList configurationList projectList |
    baselineList := Metacello registry
        baseline: 'Issue32';
        list.
    self assert: baselineList size = 1.
    baselineList do: [ :spec | self assert: (#('BaselineOfIssue32') includes: spec className) ].
    configurationList := Metacello registry
        configuration: 'Issue32';
        list.
    self assert: configurationList size = 1.
    configurationList do: [ :spec | self assert: (#('ConfigurationOfIssue32') includes: spec className) ].
    projectList := Metacello registry
        project: 'Issue32';
        list.
    self assert: projectList size = 2.
    projectList do: [ :spec | self assert: (#('ConfigurationOfIssue32' 'BaselineOfIssue32') includes: spec className) ]