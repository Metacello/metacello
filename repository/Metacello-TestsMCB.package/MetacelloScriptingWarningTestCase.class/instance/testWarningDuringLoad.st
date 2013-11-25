sunit
testWarningDuringLoad
  | producedWarning externalCoreClass |
  Metacello new
    configuration: 'Issue181';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load.
  producedWarning := false.
  externalCoreClass := Smalltalk
    at: #'ExternalCore'
    ifAbsent: [ self assert: false ].
  self deny: (externalCoreClass selectors includes: #'forceWarning').
  externalCoreClass compile: 'forceWarning ^self'.	"dirty the package"
  self assert: (externalCoreClass selectors includes: #'forceWarning').
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