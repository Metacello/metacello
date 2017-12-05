attributes
devKitPlatformAttributes
  | baselineClassName |
  baselineClassName := 'BaselineOfGLASS1'.
  Smalltalk
    at: baselineClassName
    ifPresent: [ :ignored | 
      Smalltalk
        at: #'MetacelloProjectRegistration'
        ifPresent: [ :cls | 
          (cls registrationForClassNamed: baselineClassName ifAbsent: [  ])
            ifNotNil: [ :registration | 
              registration loadedInImage
                ifTrue: [ ^ #(#'glass') ] ] ] ].
  ^ #(#'gsdevkit')
