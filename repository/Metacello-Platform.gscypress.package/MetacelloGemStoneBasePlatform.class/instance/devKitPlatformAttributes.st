attributes
devKitPlatformAttributes
  | baselineClassName |
  baselineClassName := 'BaselineOfDevKit'.
  Smalltalk
    at: baselineClassName
    ifPresent: [ :ignored | 
      Smalltalk
        at: #'MetacelloProjectRegistration'
        ifPresent: [ :cls | 
          (cls registrationForClassNamed: baselineClassName ifAbsent: [  ])
            ifNotNil: [ :registration | 
              registration loadedInImage
                ifTrue: [ #(#'gsdevkit') ] ] ] ].
  ^ #(#'glass')