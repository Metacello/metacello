execution callback
projectSpecSelectBlock
    ^ [ :projectSpec | 
    MetacelloProjectRegistration
        registrationForProjectSpec: projectSpec
        ifAbsent: [ false ]
        ifPresent: [ :existingRegistration :newRegistration | existingRegistration loadedInImage ] ]