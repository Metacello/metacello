actions api
get
    "resolve project name in given repository and return an instance of MetacelloProject"

    self addStatement: #'get' args: #().
    ^ self execute