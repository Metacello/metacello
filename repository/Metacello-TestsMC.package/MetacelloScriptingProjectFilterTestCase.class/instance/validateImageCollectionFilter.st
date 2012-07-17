validation
validateImageCollectionFilter
    | baselineList configurationList projectList |
    baselineList := Metacello image
        baseline: #('Issue32' 'External');
        list.
    self assert: baselineList size = 1.
    baselineList do: [ :spec | self assert: (#('BaselineOfExternal') includes: spec className) ].
    configurationList := Metacello image
        configuration: #('Issue32' 'External');
        list.
    self assert: configurationList size = 1.
    configurationList do: [ :spec | self assert: (#('ConfigurationOfExternal') includes: spec className) ].
    projectList := Metacello image
        project: #('Issue32' 'External');
        list.
    self assert: projectList size = 2.
    projectList
        do: [ :spec | self assert: (#('ConfigurationOfExternal' 'BaselineOfExternal') includes: spec className) ]