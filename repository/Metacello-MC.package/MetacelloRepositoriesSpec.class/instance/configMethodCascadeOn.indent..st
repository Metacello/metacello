printing
configMethodCascadeOn: aStream indent: indent
  | repositorySpecs |
  repositorySpecs := MetacelloPlatform current
    sort: self map values
    with: [ :a :b | a description <= b description ].
  repositorySpecs size = 1
    ifTrue: [ repositorySpecs first configMethodCascadeOn: aStream lastCascade: true ]
    ifFalse: [ 
      1 to: repositorySpecs size do: [ :index | 
        | repositorySpec |
        indent + 1 timesRepeat: [ aStream tab ].
        (repositorySpecs at: index)
          configMethodCascadeOn: aStream
          lastCascade: index >= repositorySpecs size ] ]