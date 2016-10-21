*metacello-gscypress-mc
registry
  | userGlobals |
  userGlobals := System myUserProfile symbolList objectNamed: #UserGlobals.
  ^ userGlobals at: #'MetacelloProjectRegistration_Registry'
    ifAbsent: [ userGlobals at: #'MetacelloProjectRegistration_Registry' put: MetacelloProjectRegistry new ]
