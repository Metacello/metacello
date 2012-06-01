private
registryAt: aName ifAbsent: absentBlock
    ^ self registry at: aName ifAbsent: [ self projectSpecRegistry at: aName ifAbsent: absentBlock ]