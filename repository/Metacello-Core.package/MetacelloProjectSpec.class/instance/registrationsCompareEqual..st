scripting
registrationsCompareEqual: aMetacelloProjectSpec
    "name className versionString operator loads preLoadDoIt postLoadDoIt"

    ^ self name = aMetacelloProjectSpec name
        and: [ 
            self className = aMetacelloProjectSpec className
                and: [ self versionString = aMetacelloProjectSpec versionString and: [ self operator == aMetacelloProjectSpec operator ] ] ]