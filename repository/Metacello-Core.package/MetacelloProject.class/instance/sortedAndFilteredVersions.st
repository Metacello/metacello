private
sortedAndFilteredVersions
  ^ (MetacelloPlatform current
    sort: self map values asArray
    with: [ :a :b | a >= b ])
    select: [ :vrsn | (#(#'structural' #'broken' #'baseline') includes: vrsn blessing) not ]
