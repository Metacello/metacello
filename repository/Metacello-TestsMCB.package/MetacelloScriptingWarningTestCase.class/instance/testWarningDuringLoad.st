as yet unclassified
testWarningDuringLoad
  | producedWarning |
  Metacello new
    configuration: 'Issue181';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  (Smalltalk at: #'ExternalCore') compile: 'forceWarning ^self'.	"dirty the package"
  producedWarning := false.
  Metacello new
    configuration: 'Issue181';
    version: '0.9.3';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    onWarning: [ :ex | 
          producedWarning := true.
          ex resume ];
    load.
  self assert: producedWarning