api
project: aProjectName
    (projectSpec := self projectSpec asProjectSpec copy)
        for: MetacelloMCProject new;
        name: (self class configurationProjectNameOf: aProjectName)