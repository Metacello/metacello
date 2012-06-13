accessing
configurationProjectSpecIfPresent: presentBlock ifAbsent: absentBlock
    ^ configurationProjectSpec ifNotNil: presentBlock ifNil: absentBlock