initialization
on: aBaselineConfigurationClass
    | pragma |
    self configuration: aBaselineConfigurationClass new.
    pragma := self extractBaselinePragmaFor: aBaselineConfigurationClass.
    self evaluatePragma: pragma