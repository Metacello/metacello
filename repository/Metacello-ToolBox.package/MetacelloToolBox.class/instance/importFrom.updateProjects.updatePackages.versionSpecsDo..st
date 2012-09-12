api-configuration
importFrom: inputVersionStringOrSymbol updateProjects: updateProjects updatePackages: updatePackages versionSpecsDo: aBlock
    | constructor updatedSpecs projectAttributes fullVersionSpec version visitedSpecs fromVersionString activeSections packageSpecNames |
    constructor := self constructor.
    updatedSpecs := Set new.
    visitedSpecs := Set new.
    packageSpecNames := Bag new.
    projectAttributes := project attributes.
    version := project version: inputVersionStringOrSymbol.
    fromVersionString := version versionString.	"resolve symbolic versions"
    fullVersionSpec := version spec.
    self methodSpec imports: {fromVersionString}.
    constructor extractMethodSectionsFor: fromVersionString.
    activeSections := IdentitySet new.
    constructor
        methodSectionsInEvaluationOrder: projectAttributes
        do: [ :methodSection | 
            "collect packageSpec names ... interested in singletons"
            methodSection versionSpec
                specListProjectDo: [ :spec |  ]
                packageDo: [ :spec | packageSpecNames add: spec name ]
                groupDo: [ :spec |  ] ].
    constructor
        methodSectionsInEvaluationOrder: projectAttributes reverse
        do: [ :methodSection | 
            | versionSpec attributePath packageSpecsToDelete |
            versionSpec := methodSection versionSpec.
            attributePath := methodSection attributePath.
            versionSpec updateForSpawnMethod: versionSpec.
            packageSpecsToDelete := OrderedCollection new.
            versionSpec
                specListProjectDo: [ :spec | spec updateForSpawnMethod: spec ]
                packageDo: [ :spec | 
                    (spec updateForSpawnMethod: spec)
                        ifTrue: [ 
                            "no file speced"
                            (packageSpecNames occurrencesOf: spec name) = 1
                                ifTrue: [ 
                                    "only occurence of spec ... force update"
                                    spec file: spec name ]
                                ifFalse: [ 
                                    "need to delete this spec from version spec"
                                    packageSpecsToDelete add: spec ] ] ]
                groupDo: [ :spec | spec updateForSpawnMethod: spec ].
            packageSpecsToDelete do: [ :spec | versionSpec deleteSpec: spec ].
            self
                updateVersionSpec: versionSpec
                fullVersionSpec: fullVersionSpec
                updateProjects: updateProjects
                updatePackages: updatePackages
                visited: visitedSpecs
                updated: updatedSpecs.
            activeSections add: methodSection ].
    constructor
        methodSectionsDo: [ :methodSection | 
            | versionSpec attributePath |
            versionSpec := methodSection versionSpec.
            attributePath := methodSection attributePath.
            (activeSections includes: methodSection)
                ifTrue: [ 
                    (aBlock value: attributePath asAttributeOrPath value: versionSpec)
                        ifTrue: [ self methodSpec addMethodSection: attributePath versionSpec: versionSpec ] ] ]