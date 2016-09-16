accessing
projectSpec
  ^ baselineProjectSpec
    ifNil: [ 
      configurationProjectSpec notNil
        ifFalse: [ self error: 'Project spec unexpectedly nil.' ].
      configurationProjectSpec ]