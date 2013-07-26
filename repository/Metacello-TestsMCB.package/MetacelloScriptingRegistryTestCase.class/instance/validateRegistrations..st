as yet unclassified
validateRegistrations: rgstry
  | specs configurationRegistrations baselineRegistrations |
  specs := Metacello image
    project: [ :spec | spec name = 'External' ];
    list.
  self assert: specs size = 2.
  configurationRegistrations := rgstry configurationRegistry values.
  baselineRegistrations := rgstry configurationRegistry values.
  self assert: baselineRegistrations size = configurationRegistrations size.
  baselineRegistrations
    do: [ :baseline | 
      | matches |
      matches := configurationRegistrations
        select: [ :config | config == baseline ].
      self assert: matches size = 1 ].
  configurationRegistrations
    do: [ :config | 
      | matches |
      matches := baselineRegistrations
        select: [ :baseline | config == baseline ].
      self assert: matches size = 1 ]