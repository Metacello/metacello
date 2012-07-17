validation
validateRegistryNameFilter
    | spec projectList |
    spec := Metacello registry
        baseline: 'Issue32';
        list.
    self assert: 'BaselineOfIssue32' = spec className.
    spec := Metacello registry
        configuration: 'Issue32';
        list.
    self assert: 'ConfigurationOfIssue32' = spec className.
    projectList := Metacello registry
        project: 'Issue32';
        list.
    self assert: projectList size = 2.
    projectList
        do: [ :projectSpec | self assert: (#('ConfigurationOfIssue32' 'BaselineOfIssue32') includes: projectSpec className) ]