scripting
metacelloRegistrationHash
  ^ ((MetacelloPlatform current
    sort: self map values
    with: [ :a :b | a description <= b description ])
    collect: [ :each | each description ]) hash