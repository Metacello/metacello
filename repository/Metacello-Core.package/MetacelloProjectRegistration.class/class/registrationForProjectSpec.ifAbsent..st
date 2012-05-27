registration
registrationForProjectSpec: aProjectSpec ifAbsent: absentBlock
    ^ self registry at: aProjectSpec name ifAbsent: absentBlock