*metacello-core
scriptExecutorClass: anExecutorSpec
  Metacello current
    globalNamed: anExecutorSpec key
    ifAbsent: [ ConfigurationOf ensureMetacello: anExecutorSpec value ].
  ^ Metacello current globalNamed: anExecutorSpec key