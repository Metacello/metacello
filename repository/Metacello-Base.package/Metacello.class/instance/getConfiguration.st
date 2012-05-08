actions api
getConfiguration
    "resolve project name in given repository and return an instance of MetacelloProject resolved from a ConfigurationOf"

    self addStatement: #'getConfiguration' args: #().
    ^ self execute