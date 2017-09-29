versions
symbolicVersionSymbols
  ^ MetacelloPlatform current
    sort: self symbolicVersionMap keys asArray
    with: [ :a :b | a <= b ]
