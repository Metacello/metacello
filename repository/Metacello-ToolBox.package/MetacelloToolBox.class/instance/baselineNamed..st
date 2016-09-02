api-configuration
baselineNamed: baseName
  | baselineName |
  "Check if the class does not exist"
  baselineName := self baselineNameFrom: baseName.
  (MetacelloPlatform current globalNamed: baselineName asSymbol ifAbsent: [  ])
    ifNil: [ 
      "Create the configuration class"
      self ensureMetacello.
      BaselineOf
        subclass: baselineName asSymbol
        instanceVariableNames: ''
        classVariableNames: ''
        poolDictionaries: ''
        category: baselineName.
      MetacelloPlatform current registerPackageNamed: baselineName.
      (MetacelloPlatform current globalNamed: baselineName asSymbol)
        compile: 'baseline: spec <baseline>'
        classified: 'baseline'	"a bit of a hack here to create an initial null basline method" ].
  project := (MetacelloPlatform current globalNamed: baselineName asSymbol)
    project