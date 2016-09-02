spec creation
createConfiguration: baseName
  | configurationName |
  "Check if the class does not exist"
  configurationName := (baseName beginsWith: 'ConfigurationOf')
    ifTrue: [ baseName ]
    ifFalse: [ 'ConfigurationOf' , baseName ].
  (MetacelloPlatform current globalNamed: configurationName asSymbol)
    ifNil: [ 
      self ensureMetacello.	"Create the configuration class"
      MetacelloPlatform current
        copyClass:
          (MetacelloPlatform current globalNamed: #'MetacelloConfigTemplate')
        as: configurationName asSymbol
        inCategory: configurationName asString.	"Create the package that has the same name"
      MetacelloPlatform current registerPackageNamed: configurationName ].
  ^ (MetacelloPlatform current globalNamed: configurationName asSymbol) project