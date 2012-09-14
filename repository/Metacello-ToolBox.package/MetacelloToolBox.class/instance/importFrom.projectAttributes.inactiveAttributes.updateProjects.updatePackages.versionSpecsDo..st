api-configuration
importFrom: inputVersionStringOrSymbol projectAttributes: projectAttributes inactiveAttributes: inactiveAttributes updateProjects: updateProjects updatePackages: updatePackages versionSpecsDo: aBlock
    | constructor updatedSpecs fullVersionSpec version visitedSpecs fromVersionString attributeSet |
    constructor := self constructor.
    updatedSpecs := Set new.
    visitedSpecs := Set new.
    version := project version: inputVersionStringOrSymbol.
    fromVersionString := version versionString.	"resolve symbolic versions"
    fullVersionSpec := version spec.
    self methodSpec imports: {fromVersionString}.
    constructor extractMethodSectionsFor: fromVersionString.
    self
        editVersionSpecsForImport: constructor
        projectAttributes: projectAttributes
        active: true
        fullVersionSpec: fullVersionSpec
        updateProjects: updateProjects
        updatePackages: updatePackages
        visited: visitedSpecs
        updated: updatedSpecs.
    self
        editVersionSpecsForImport: constructor
        projectAttributes: inactiveAttributes
        active: false
        fullVersionSpec: fullVersionSpec
        updateProjects: updateProjects
        updatePackages: updatePackages
        visited: visitedSpecs
        updated: updatedSpecs.
    attributeSet := (inactiveAttributes , projectAttributes) asSet.
    constructor
        methodSectionsDo: [ :methodSection | 
            | versionSpec attributePath |
            versionSpec := methodSection versionSpec.
            attributePath := methodSection attributePath.
            (methodSection includesAttributeFrom: attributeSet)
                ifFalse: [ 
                    versionSpec updateForSpawnMethod: versionSpec.
                    versionSpec
                        specListProjectDo: [ :spec | spec updateForSpawnMethod: spec ]
                        packageDo: [ :spec | spec updateForSpawnMethod: spec ]
                        groupDo: [ :spec | spec updateForSpawnMethod: spec ].
                    self
                        clearVersionSpec: versionSpec
                        fullVersionSpec: fullVersionSpec
                        updateProjects: updateProjects
                        updatePackages: updatePackages ].
            (aBlock value: attributePath asAttributeOrPath value: versionSpec)
                ifTrue: [ self methodSpec addMethodSection: attributePath versionSpec: versionSpec ] ]