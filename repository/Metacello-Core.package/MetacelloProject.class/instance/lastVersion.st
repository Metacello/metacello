versions
lastVersion
  | coll |
  coll := (MetacelloPlatform current
    sort: self map values asArray
    with: [ :a :b | a <= b ]) asOrderedCollection.
  coll isEmpty
    ifTrue: [ ^ nil ].
  ^ coll last
