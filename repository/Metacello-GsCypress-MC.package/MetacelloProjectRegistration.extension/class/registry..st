*metacello-gscypress-mc
registry: aMetacelloProjectRegistry
  | userGlobals |
  userGlobals := System myUserProfile symbolList objectNamed: #UserGlobals.
  userGlobals at: #'MetacelloProjectRegistration_Registry' put: aMetacelloProjectRegistry
