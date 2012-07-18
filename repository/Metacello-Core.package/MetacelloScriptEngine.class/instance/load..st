actions api
load: required
    self
        load: required
        onProjectDownGrade: [ :ex :existing :new | 
            MetacelloScriptingError
                signal:
                    'Use downgrade command to downgrade project from ' , existing printString , ' to ' , new printString ]
        onProjectUpgrade: [ :ex :existing :new | 
            MetacelloScriptingError
                signal: 'Use upgrade command to upgrade project from ' , existing printString , ' to ' , new printString ]
        onProjectLock: [ :ex :existing :ignored | MetacelloScriptingError signal: 'Use upgrade command to upgrade locked project ' , existing printString ]