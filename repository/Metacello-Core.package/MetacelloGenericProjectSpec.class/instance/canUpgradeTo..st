scripting
canUpgradeTo: aMetacelloProjectSpec
    ^ (super canUpgradeTo: aMetacelloProjectSpec)
        and: [ self repositories registrationsCompareEqual: aMetacelloProjectSpec repositories ]