tests
testNameFilter
    | baselineList configurationList projectList |
    Metacello new
        baseline: 'GithubRefIV';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    baselineList := Metacello registry
        baseline: 'External';
        list.
    self assert: baselineList size = 1.
    baselineList do: [ :spec | self assert: (#('BaselineOfExternal') includes: spec className) ].
    configurationList := Metacello registry
        configuration: 'External';
        list.
    self assert: configurationList size = 1.
    configurationList do: [ :spec | self assert: (#('ConfigurationOfExternal') includes: spec className) ].
    projectList := Metacello registry
        project: 'External';
        list.
    self assert: projectList size = 1.
    projectList do: [ :spec | self assert: (#('External') includes: spec name) ]