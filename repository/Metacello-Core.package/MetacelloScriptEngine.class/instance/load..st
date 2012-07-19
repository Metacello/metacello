actions api
load: required
    self
        load: required
        onProjectDownGrade: [ :ex :existing :new | ex allow ]
        onProjectUpgrade: [ :ex :existing :new | ex allow ]