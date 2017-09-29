versions
versions
  ^ MetacelloPlatform current
    sort: self map values asArray
    with: [ :a :b | a <= b ]
