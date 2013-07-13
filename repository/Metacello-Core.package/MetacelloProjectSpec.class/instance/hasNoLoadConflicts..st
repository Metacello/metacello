scripting
hasNoLoadConflicts: aMetacelloProjectSpec
  "same as compareEqual:, except if versionString and/or repositories are not 
	specified for either one, then there are not conflicts"

  ^ self className = aMetacelloProjectSpec className
    and: [ 
      ((self versionString == nil or: [ aMetacelloProjectSpec versionString == nil ])
        or: [ self versionOrNil = aMetacelloProjectSpec versionOrNil ])
        and: [ self operator == aMetacelloProjectSpec operator ] ]