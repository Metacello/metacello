accessing
versionString
    ^ (configurationProjectSpec ifNil: [ baselineProjectSpec ]) versionString