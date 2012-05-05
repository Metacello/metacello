initialization
on: aBaselineConfigurationClass project: aProject
    | pragma versionMap versionSpec |
    self configuration: aBaselineConfigurationClass new.
    pragma := self extractBaselinePragmaFor: aBaselineConfigurationClass.
    self
        setProject:
            (aProject
                ifNil: [ 
                    [ aBaselineConfigurationClass project ]
                        on: MessageNotUnderstood
                        do: [ :ex | ex return: nil ] ]).
    versionSpec := self project versionSpec.
    self root: versionSpec.
    self evaluatePragma: pragma.
    versionMap := Dictionary new.
    self project attributes
        do: [ :attribute | 
            | blockList |
            (blockList := self attributeMap at: attribute ifAbsent: [  ]) ~~ nil
                ifTrue: [ blockList do: [ :block | self with: versionSpec during: block ] ] ].
    versionMap at: self project singletonVersionName put: versionSpec createVersion.
    self project map: versionMap