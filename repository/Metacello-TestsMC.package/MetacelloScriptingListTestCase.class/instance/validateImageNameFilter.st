validation
validateImageNameFilter
    | baselineList configurationList projectList |
    baselineList := Metacello image
        baseline: 'External';
        list.
    self assert: baselineList size = 1.
    baselineList do: [ :spec | self assert: (#('BaselineOfExternal') includes: spec className) ].
    configurationList := Metacello image
        configuration: 'External';
        list.
    self assert: configurationList size = 1.
    configurationList do: [ :spec | self assert: (#('ConfigurationOfExternal') includes: spec className) ].
    projectList := Metacello image
        project: 'External';
        list.
    self assert: projectList size = 2.
    projectList
        do: [ :spec | self assert: (#('ConfigurationOfExternal' 'BaselineOfExternal') includes: spec className) ]