scripting
registrationsCompareEqual: aMetacelloProjectSpec
    "projectPackage (ignored) repositories"

    ^ (super registrationsCompareEqual: aMetacelloProjectSpec)
        and: [ self repositories registrationsCompareEqual: aMetacelloProjectSpec repositories ]