printing
configPackagesSpecMethodOn: aStream indent: indent
  | projectSpecs packageSpecs groupSpecs |
  projectSpecs := OrderedCollection new.
  packageSpecs := OrderedCollection new.
  groupSpecs := OrderedCollection new.
  self packagesSpec list
    do: [ :member | 
      member spec
        projectDo: [ :proj | 
          member spec name ~~ nil
            ifTrue: [ projectSpecs add: member ] ]
        packageDo: [ :package | 
          member spec name ~~ nil
            ifTrue: [ packageSpecs add: member ] ]
        groupDo: [ :group | 
          member spec name ~~ nil
            ifTrue: [ groupSpecs add: member ] ] ].
  projectSpecs isEmpty not
    ifTrue: [ 
      indent timesRepeat: [ aStream tab ].
      aStream nextPutAll: 'spec '.
      projectSpecs size > 1
        ifTrue: [ 
          aStream cr.
          indent + 1 timesRepeat: [ aStream tab ] ].
      1 to: projectSpecs size do: [ :index | 
        (projectSpecs at: index)
          configMethodCascadeOn: aStream
          last: index == projectSpecs size
          indent: indent + 1.
        index ~= projectSpecs size
          ifTrue: [ indent + 1 timesRepeat: [ aStream tab ] ] ] ].
  packageSpecs isEmpty not
    ifTrue: [ 
      projectSpecs isEmpty not
        ifTrue: [ aStream cr ].
      indent timesRepeat: [ aStream tab ].
      aStream nextPutAll: 'spec '.
      packageSpecs size > 1
        ifTrue: [ 
          aStream cr.
          indent + 1 timesRepeat: [ aStream tab ] ].
      1 to: packageSpecs size do: [ :index | 
        (packageSpecs at: index)
          configMethodCascadeOn: aStream
          last: index == packageSpecs size
          indent: indent + 1.
        index ~= packageSpecs size
          ifTrue: [ indent + 1 timesRepeat: [ aStream tab ] ] ] ].
  groupSpecs isEmpty not
    ifTrue: [ 
      projectSpecs isEmpty not | packageSpecs isEmpty not
        ifTrue: [ aStream cr ].
      indent timesRepeat: [ aStream tab ].
      aStream nextPutAll: 'spec '.
      groupSpecs size > 1
        ifTrue: [ 
          aStream cr.
          indent + 1 timesRepeat: [ aStream tab ] ].
      1 to: groupSpecs size do: [ :index | 
        (groupSpecs at: index)
          configMethodCascadeOn: aStream
          last: index == groupSpecs size
          indent: indent + 1.
        index ~= groupSpecs size
          ifTrue: [ indent + 1 timesRepeat: [ aStream tab ] ] ] ]
