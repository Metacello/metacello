validation
validateImageNameFilter
    | spec projectList |
    spec := Metacello image
        baseline: 'External';
        list.
    self assert: 'BaselineOfExternal' = spec className.
    spec := Metacello image
        configuration: 'External';
        list.
    self assert: 'ConfigurationOfExternal' = spec className.
    projectList := Metacello image
        project: 'External';
        list.
    self assert: projectList size = 2.
    projectList
        do: [ :projectSpec | self assert: (#('ConfigurationOfExternal' 'BaselineOfExternal') includes: projectSpec className) ]