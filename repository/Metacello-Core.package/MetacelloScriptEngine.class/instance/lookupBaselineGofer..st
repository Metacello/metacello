project lookup
lookupBaselineGofer: baselineName
    | pkgRef cachedGofer references gf description |
    pkgRef := GoferPackageReference name: baselineName.
    description := self repositoryDescription.
    cachedGofer := self goferCache
        at: description
        ifAbsent: [ 
            "leverage resolvedReferencesCache in gofer instance, so we don't have to keep reading from network"
            gf := Gofer new.
            gf disablePackageCache.
            gf
                repository:
                    (self repositorySpec
                        description: description;
                        yourself) createRepository.
            self goferCache at: description put: gf.
            gf ].
    (pkgRef resolveAllWith: cachedGofer) notEmpty
        ifTrue: [ ^ cachedGofer ].
    ^ nil