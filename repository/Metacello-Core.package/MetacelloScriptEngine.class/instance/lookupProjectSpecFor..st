project lookup
lookupProjectSpecFor: aProjectSpec
  | registration |
  registration := self
    lookupRegistrationFor: aProjectSpec
    isAbsent: [ :new | 
      "new is chosen"
       ]
    isExisting: [ :existing :new | 
      "new is chosen"
       ]
    isConflict: [ :existing :new :chosen | 
      "chosen is chosen"
       ].
  ^ registration projectSpec