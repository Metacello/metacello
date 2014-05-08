as yet unclassified
validateLockedRegistrations: rgstry
  "not in image"

  | registration |
  registration := rgstry
    registrationForClassNamed: 'BaselineOfExternal'
    ifAbsent: [ ^ nil ].
  self assert: registration locked.
  self deny: registration loadedInImage.
  ^ registration baselineProjectSpec