registration
registrationForClassNamed: aClassName ifAbsent: absentBlock
    ^ self configurationRegistry
        at: aClassName
        ifAbsent: [ ^ self baselineRegistry at: aClassName ifAbsent: absentBlock ]