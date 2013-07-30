as yet unclassified
testWarningDuringLoad
  | producedWarning |
  Metacello new
    configuration: 'Issue181';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  producedWarning := false.
  (Smalltalk
    at: #'ExternalCore'
    ifAbsent: [ 
      Transcript
        cr;
        show: 'Missing class: ExternalCore'.
      self assert: false ])
    compile: 'forceWarning ^self'.	"dirty the package"
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