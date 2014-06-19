api actions
unregister
  "unlock projects in registry"

  self addStatement: #'unregister' args: #().
  ^ self execute