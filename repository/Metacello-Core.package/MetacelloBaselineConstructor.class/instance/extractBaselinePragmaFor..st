pragma extraction
extractBaselinePragmaFor: aClass
  | pragmas |
  pragmas := Pragma allNamed: #'baseline' in: aClass.
  pragmas isEmpty
    ifTrue: [ ^ nil ].
  ^ pragmas first
