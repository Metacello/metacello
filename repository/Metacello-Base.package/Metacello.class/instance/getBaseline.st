actions api
getBaseline
    "resolve project name in given repository and return an instance of MetacelloProject resolved from a BaselineOf"

    self addStatement: #'getBaseline' args: #().
    ^ self execute