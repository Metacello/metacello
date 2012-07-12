args
projectSpecFromArgs
    baselineArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ MetacelloMCBaselineProject new projectSpec asBaselineProjectSpec
                name: (MetacelloScriptEngine baselineProjectNameOf: baselineArg);
                yourself ].
    configurationArg
        ifNotNil: [ 
            baselineArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' configuration and project are both be specified' ].
            ^ MetacelloMCProject new projectSpec asConfigurationProjectSpec
                name: (MetacelloScriptEngine configurationProjectNameOf: configurationArg);
                yourself ].
    projectArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' project and configuration: are both be specified' ].
            baselineArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ MetacelloMCProject new projectSpec
                name: (MetacelloScriptEngine configurationProjectNameOf: projectArg);
                yourself ].
    self error: 'project, baseline, or configuration not specified'