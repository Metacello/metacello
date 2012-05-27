registration
registrationForProjectNamed: aProjectName ifAbsent: absentBlock
    ^ self registry at: aProjectName ifAbsent: absentBlock