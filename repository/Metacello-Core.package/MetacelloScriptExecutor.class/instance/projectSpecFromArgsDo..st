execution
projectSpecFromArgsDo: aBlock
    baselineArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ aBlock
                value: MetacelloMCBaselineProject new projectSpec asBaselineProjectSpec
                value: baselineArg
                value: [ :projectName | MetacelloScriptEngine baselineProjectNameOf: projectName ]
                value: [ :projectName | MetacelloScriptEngine baselineNameFrom: projectName ] ].
    configurationArg
        ifNotNil: [ 
            baselineArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' configuration and project are both be specified' ].
            ^ aBlock
                value: MetacelloMCProject new projectSpec asConfigurationProjectSpec
                value: configurationArg
                value: [ :projectName | MetacelloScriptEngine configurationProjectNameOf: projectName ]
                value: [ :projectName | MetacelloScriptEngine configurationNameFrom: projectName ] ].
    projectArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' project and configuration: are both be specified' ].
            baselineArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ aBlock
                value: MetacelloMCProject new projectSpec
                value: projectArg
                value: [ :projectName | MetacelloScriptEngine configurationProjectNameOf: projectName ]
                value: [ :projectName | MetacelloScriptEngine configurationNameFrom: projectName ] ].
    self error: 'project, baseline, or configuration not specified'