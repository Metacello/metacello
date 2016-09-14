attributes
devKitPlatformAttributes
  | baselineClassName |
  baselineClassName := 'BaselineOfDevKit'.
  self
    globalNamed: baselineClassName
    ifPresent: [ :ignored | 
      self
        globalNamed: 'MetacelloProjectRegistration'
        ifPresent: [ :cls | 
          (cls registrationForClassNamed: baselineClassName ifAbsent: [  ])
            ifNotNil: [ :registration | 
              registration loadedInImage
                ifTrue: [ #(#'gsdevkit') ] ] ] ].
  ^ #(#'glass')
