*metacello-platform
asMetacelloCachingResolvedReference
  | cl |
  cl := Smalltalk at: #'MetacelloCachingGoferResolvedReference'.
  cl ifNil: [ ^ self ].
  ^ cl name: self name repository: self repository