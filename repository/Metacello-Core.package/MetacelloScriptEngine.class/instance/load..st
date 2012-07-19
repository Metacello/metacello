actions api
load: required
    self
        load: required
        onProjectDownGrade: [ :ex :existing :new | 
            MetacelloUseUpgradeError
                signal:
                    'Use downgrade command to downgrade project from ' , existing printString , ' to ' , new printString ]
        onProjectUpgrade: [ :ex :existing :new | 
            MetacelloUseUpgradeError
                signal: 'Use upgrade command to upgrade project from ' , existing printString , ' to ' , new printString ]