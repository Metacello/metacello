api options
onConflictUseIncoming: incoming useLoaded: loaded
  self
    onConflict: [ :ex :loaded :incoming | 
      (incoming includes: incoming baseName)
        ifTrue: [ ex useIncoming ]
        ifFalse: [ 
          (loaded includes: incoming baseName)
            ifTrue: [ ex useLoaded ] ].
      ex pass ]