api-configuration
importFrom: inputVersionStringOrSymbol updateProjects: updateProjects updatePackages: updatePackages versionSpecsDo: aBlock
    | constructor updatedSpecs projectAttributes fullVersionSpec version visitedSpecs fromVersionString activeSections |
    constructor := self constructor.
    updatedSpecs := Set new.
    visitedSpecs := Set new.
    projectAttributes := project attributes.
    version := project version: inputVersionStringOrSymbol.
    fromVersionString := version versionString.	"resolve symbolic versions"
    fullVersionSpec := version spec.
    self methodSpec imports: {fromVersionString}.
    constructor extractMethodSectionsFor: fromVersionString.
    activeSections := IdentitySet new.
    constructor
        methodSectionsInEvaluationOrder: projectAttributes
        do: [ :methodSection | activeSections add: methodSection ].
    constructor
        methodSectionsDo: [ :methodSection | 
            | versionSpec attributePath |
            versionSpec := methodSection versionSpec.
            attributePath := methodSection attributePath.
            versionSpec updateForSpawnMethod: versionSpec.
            versionSpec
                specListProjectDo: [ :spec | spec updateForSpawnMethod: spec ]
                packageDo: [ :spec | spec updateForSpawnMethod: spec ]
                groupDo: [ :spec | spec updateForSpawnMethod: spec ].
            (activeSections includes: methodSection)
                ifTrue: [ 
                    self
                        updateVersionSpec: versionSpec
                        fullVersionSpec: fullVersionSpec
                        updateProjects: updateProjects
                        updatePackages: updatePackages
                        visited: visitedSpecs
                        updated: updatedSpecs ]
                ifFalse: [ 
                    self
                        clearVersionSpec: versionSpec
                        fullVersionSpec: fullVersionSpec
                        updateProjects: updateProjects
                        updatePackages: updatePackages ].
            (aBlock value: attributePath asAttributeOrPath value: versionSpec)
                ifTrue: [ self methodSpec addMethodSection: attributePath versionSpec: versionSpec ] ]