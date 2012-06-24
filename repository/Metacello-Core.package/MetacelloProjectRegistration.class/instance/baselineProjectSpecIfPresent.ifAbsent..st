accessing
baselineProjectSpecIfPresent: presentBlock ifAbsent: absentBlock
    ^ baselineProjectSpec ifNotNil: presentBlock ifNil: absentBlock