scripting
canUpgradeTo: aMetacelloProjectSpec
    (self className = aMetacelloProjectSpec className and: [ self operator == aMetacelloProjectSpec operator ])
        ifFalse: [ ^ false ].
    ^ aMetacelloProjectSpec version perform: self operator with: self version