exception handling
defaultAction
    "Result of signal should be the projectRegistration to be used to perform the load ... default is to disallow"

    ^ MetacelloConflictingProjectError
        signal:
            'Load Conflict between existing ' , self existingProjectRegistration printString , ' and '
                , self newProjectRegistration printString