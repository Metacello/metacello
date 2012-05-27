instance creation
fromMCBaselineProjectSpec: aProjectSpec
    ^ self new
        projectName: (MetacelloScriptEngine baselineProjectNameOf: aProjectSpec className);
        baselineProjectSpec: aProjectSpec;
        yourself