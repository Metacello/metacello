as yet unclassified
validateRegistrations: rgstry
  | specs |
  specs := Metacello image
    project: [ :spec | spec name = 'External' ];
    list.
  self assert: specs size = 1