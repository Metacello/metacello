private
compareEqualTo: aMetacelloVersionNumber
    aMetacelloVersionNumber species = self species
        ifFalse: [ ^ false ].
    ^ (self compareEqualTo: self normalVersion other: aMetacelloVersionNumber normalVersion)
        and: [ 
            (self compareEqualTo: self preReleaseVersion other: aMetacelloVersionNumber preReleaseVersion)
                and: [ self compareEqualTo: self buildVersion other: aMetacelloVersionNumber buildVersion ] ]