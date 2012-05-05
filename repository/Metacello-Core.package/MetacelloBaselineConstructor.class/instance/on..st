initialization
on: aBaselineConfigurationClass
    | pragma versionMap |
    self configuration: aBaselineConfigurationClass new.
    pragma := self extractBaselinePragmaFor: aBaselineConfigurationClass.
    self root: self project versionSpec.
    self evaluatePragma: pragma.
    versionMap := Dictionary new.
    versionMap at: self project singletonVersionName put: self root createVersion.
    self project map: versionMap