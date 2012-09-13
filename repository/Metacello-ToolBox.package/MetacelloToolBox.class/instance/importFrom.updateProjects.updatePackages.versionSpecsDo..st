api-configuration
importFrom: inputVersionStringOrSymbol updateProjects: updateProjects updatePackages: updatePackages versionSpecsDo: aBlock
    ^ self
        importFrom: inputVersionStringOrSymbol
        projectAttributes: project attributes
        updateProjects: updateProjects
        updatePackages: updatePackages
        versionSpecsDo: aBlock