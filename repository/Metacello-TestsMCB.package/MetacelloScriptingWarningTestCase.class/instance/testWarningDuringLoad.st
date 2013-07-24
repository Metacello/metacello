as yet unclassified
testWarningDuringLoad
  | projectSpec |
  Metacello new
    configuration: 'ExternalX';
    version: #'stable';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    load.
  (Smalltalk at: #'ExternalCoreX') compile: 'forceWarning ^self'.
  self halt