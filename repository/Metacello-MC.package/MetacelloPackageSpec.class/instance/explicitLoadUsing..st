loading
explicitLoadUsing: mcLoader
  | fetchingSpecLoader |
  self isDirty
    ifTrue: [ 
      (MetacelloSkipDirtyPackageLoad signal: self)
        ifTrue: [ 
          Transcript
            cr;
            show: 'Skipping load of modified package: ' , self file.
          ^ self ]
        ifFalse: [ 
          Transcript
            cr;
            show: 'Load over modified package: ' , self file ] ].	"fetch and explicitly load it"
  fetchingSpecLoader := mcLoader fetchingSpecLoader.
  fetchingSpecLoader
    explicitLoadPackageSpecs: (Array with: self)
    repositories: (fetchingSpecLoader repositoriesFrom: self repositorySpecs)
