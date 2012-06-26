querying
packageNamed: aString forMap: map ifAbsent: absentBlock
    ^ self
        packageNamed: aString
        forLoad: false
        forMap: map
        ifAbsent: absentBlock