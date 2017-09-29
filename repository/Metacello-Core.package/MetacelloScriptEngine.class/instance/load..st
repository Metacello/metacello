actions api
load: required
  "allow downgrade, upgrade and broken lock when a locked project is directly loaded"

  self
    load: required
    onProjectDownGrade: [ :ex :existing :new | ex allowEvenIfLocked ]
    onProjectUpgrade: [ :ex :existing :new | ex allowEvenIfLocked ]
    onLockedProjectChange: [ :ex :existing :new | ex allowEvenIfLocked ]
