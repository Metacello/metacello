scripting
registrationsCompareEqual: aMetacelloProjectSpec
    "file"

    ^ (super registrationsCompareEqual: aMetacelloProjectSpec) and: [ self file = aMetacelloProjectSpec file ]