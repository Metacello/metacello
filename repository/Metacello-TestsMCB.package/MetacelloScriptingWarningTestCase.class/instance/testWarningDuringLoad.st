as yet unclassified
testWarningDuringLoad
  | producedWarning |
  Metacello new
    configuration: 'ExternalX';
    version: #'stable';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    load.
  (Smalltalk at: #'ExternalCoreX') compile: 'forceWarning ^self'.	"dirty the package"
  producedWarning := false.
  Metacello new
    configuration: 'ExternalX';
    version: #'stable';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    onWarning: [ :ex | 
          producedWarning := true.
          ex resume ];
    load.
  self assert: producedWarning