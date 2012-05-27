instance creation
fromMCConfigurationProjectSpec: aProjectSpec
    ^ self new
        projectName: (MetacelloScriptEngine configurationProjectNameOf: aProjectSpec className);
        configurationProjectSpec: aProjectSpec;
        yourself