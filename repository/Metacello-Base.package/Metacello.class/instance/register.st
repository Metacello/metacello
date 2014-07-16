api actions
register
  "change registered project"

  self addStatement: #'register' args: #().
  ^ self execute