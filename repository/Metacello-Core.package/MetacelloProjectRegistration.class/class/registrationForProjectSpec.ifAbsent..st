registration
registrationForProjectSpec: aProjectSpec ifAbsent: absentBlock
    ^ self registrationForProjectNamed: aProjectSpec asProjectRegistration projectName ifAbsent: absentBlock