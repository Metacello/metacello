Creation
reset
  "self reset"

  self isAbstract
    ifTrue: [ self subclasses do: [ :each | each reset ] ]
    ifFalse: [ super reset ]