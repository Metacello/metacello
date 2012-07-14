execution
projectSpecFromArgsDo: aBlock
    baselineArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ aBlock
                value: baselineArg
                value: [ :projectName | {(MetacelloMCBaselineProject new baselineOfProjectSpec name: projectName)} ]
                value: [ :projectName | 
                    {(MetacelloProjectRegistration
                        projectSpecForClassNamed: (MetacelloScriptEngine baselineNameFrom: projectName)
                        ifAbsent: [  ])} ]
                value: MetacelloProjectRegistration baselineProjectSpecs ].
    configurationArg
        ifNotNil: [ 
            baselineArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' configuration and project are both be specified' ].
            ^ aBlock
                value: configurationArg
                value: [ :projectName | {(MetacelloMCProject new configurationOfProjectSpec name: projectName)} ]
                value: [ :projectName | 
                    {(MetacelloProjectRegistration
                        projectSpecForClassNamed: (MetacelloScriptEngine configurationNameFrom: projectName)
                        ifAbsent: [  ])} ]
                value: MetacelloProjectRegistration configurationProjectSpecs ].
    projectArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' project and configuration: are both be specified' ].
            baselineArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ aBlock
                value: projectArg
                value: [ :projectName | {(MetacelloMCProject new projectSpec name: projectName)} ]
                value: [ :projectName | 
                    {(MetacelloProjectRegistration
                        projectSpecForClassNamed: (MetacelloScriptEngine baselineNameFrom: projectName)
                        ifAbsent: [  ]).
                    (MetacelloProjectRegistration
                        projectSpecForClassNamed: (MetacelloScriptEngine configurationNameFrom: projectName)
                        ifAbsent: [  ])} ]
                value: MetacelloProjectRegistration projectSpecs ].
    self error: 'project, baseline, or configuration not specified'