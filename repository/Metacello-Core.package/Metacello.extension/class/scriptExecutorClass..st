*metacello-core
scriptExecutorClass: anExecutorSpec
  MetacelloPlatform current
    globalNamed: anExecutorSpec key
    ifAbsent: [ ConfigurationOf ensureMetacello: anExecutorSpec value ].
  ^ MetacelloPlatform current globalNamed: anExecutorSpec key