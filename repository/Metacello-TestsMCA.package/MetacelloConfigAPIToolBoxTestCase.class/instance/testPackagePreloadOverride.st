test package
testPackagePreloadOverride
  | project versionSpec version |
  project := self project.
  versionSpec := (version := project version: '1.2.6-baseline') spec.
  self
    deny:
      (MetacelloPlatform current
        globalNamed: #'Metacello_Configuration_Test_DoIt_Result').
  self
    deny:
      (MetacelloPlatform current
        globalNamed: #'Metacello_Configuration_Test_POST_DoIt_Result').
  version load.
  self
    deny:
      (MetacelloPlatform current
        globalNamed: #'Metacello_Configuration_Test_DoIt_Result').
  self
    deny:
      (MetacelloPlatform current
        globalNamed: #'Metacello_Configuration_Test_POST_DoIt_Result')