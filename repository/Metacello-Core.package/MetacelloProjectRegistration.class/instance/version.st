accessing
version
    ^ (configurationProjectSpec ifNil: [ baselineProjectSpec ]) version