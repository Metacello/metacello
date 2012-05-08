scripting
projectFrom: aScriptingEngine unconditionalLoad: aBool
    "if there is a ConfigurationOf, then snag it, otherwise attempt to grab BaselineOf"

    [ ^ aScriptingEngine getConfigurationProjectUnconditionalLoad: aBool ]
        on: MetacelloPackageSpecResolutionError
        do: [ :ex | ^ aScriptingEngine getBaselineProjectUnconditionalLoad: aBool ]