scripting
compareEqual: aMetacelloProjectSpec
  "name className versionString operator loads preLoadDoIt postLoadDoIt"

  ^ self className = aMetacelloProjectSpec className
    and: [ 
      (self compareVersionsEqual: aMetacelloProjectSpec)
        and: [ 
          self operator == aMetacelloProjectSpec operator
            and: [ 
              self loads = aMetacelloProjectSpec loads
                and: [ 
                  self preLoadDoIt == aMetacelloProjectSpec preLoadDoIt
                    and: [ self postLoadDoIt == aMetacelloProjectSpec postLoadDoIt ] ] ] ] ]