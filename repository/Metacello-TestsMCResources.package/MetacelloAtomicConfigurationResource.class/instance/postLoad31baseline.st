ConfigurationOfAtomicFan
postLoad31baseline
  "Throw an error if GoferFar isn't loaded"

  Metacello current
    globalNamed: #'GoferFar'
    ifAbsent: [ self error: 'GoferFar should be loaded' ]