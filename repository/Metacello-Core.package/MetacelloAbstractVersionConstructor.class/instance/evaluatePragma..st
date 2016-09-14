private
evaluatePragma: pragma
  pragma ifNil: [ ^ self ].
  currentContext := pragma.
  [ self configuration perform: pragma selector with: self ]
    ensure: [ currentContext := nil ]