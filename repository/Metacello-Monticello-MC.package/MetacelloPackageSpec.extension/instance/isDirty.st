*metacello-monticello-mc
isDirty
  | wc |
  ^ (wc := self workingCopy) ~~ nil and: [ wc needsSaving ]