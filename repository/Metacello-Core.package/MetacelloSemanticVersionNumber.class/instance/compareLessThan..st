private
compareLessThan: aMetacelloVersionNumber
    aMetacelloVersionNumber species = self species
        ifFalse: [ ^ false ].
    ^ (self compareEqualTo: self normalVersion other: aMetacelloVersionNumber normalVersion)
        ifTrue: [ 
            (self compareEqualTo: self preReleaseVersion other: aMetacelloVersionNumber preReleaseVersion)
                ifTrue: [ self compareLessThan: self buildVersion other: aMetacelloVersionNumber buildVersion ]
                ifFalse: [ 
                    (self compareLessThan: self preReleaseVersion other: aMetacelloVersionNumber preReleaseVersion)
                        and: [ self compareLessThan: self buildVersion other: aMetacelloVersionNumber buildVersion ] ] ]
        ifFalse: [ 
            (self compareLessThan: self normalVersion other: aMetacelloVersionNumber normalVersion)
                and: [ 
                    (self compareLessThan: self preReleaseVersion other: aMetacelloVersionNumber preReleaseVersion)
                        and: [ self compareLessThan: self buildVersion other: aMetacelloVersionNumber buildVersion ] ] ]