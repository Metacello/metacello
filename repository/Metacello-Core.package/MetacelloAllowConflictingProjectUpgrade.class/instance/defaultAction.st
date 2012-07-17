exception handling
defaultAction
    "Result of signal should be the projectRegistration to be used to perform the load ... default is to disallow"

    ^ self
        error:
            'Load Conflict between existing ' , self existingProjectRegistration printString , ' and '
                , self newProjectRegistration printString