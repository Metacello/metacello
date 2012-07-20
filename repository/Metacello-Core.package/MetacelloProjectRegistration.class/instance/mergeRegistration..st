merging
mergeRegistration: anotherRegistration
    self copyOnWrite: [ :copy | copy merge: anotherRegistration ]