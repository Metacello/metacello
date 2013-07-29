as yet unclassified
testWarningDuringLoad
  | producedWarning originalModifiedPackages modifiedPackages |
  Metacello new
    configuration: 'Issue181';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  (Smalltalk at: #'SystemChangeNotifier')
    ifPresent: [ :cl | 
      cl uniqueInstance silenceLevel > 0
        ifTrue: [ 
          Transcript
            cr;
            show:
                'WARNING: (SystemChangeNotifier uniqueInstance silenceLevel) > 0: '
                    , cl uniqueInstance silenceLevel printString.
          cl uniqueInstance silenceLevel: 0 ] ].
  originalModifiedPackages := MCWorkingCopy allManagers
    select: [ :each | each modified ].
  (Smalltalk at: #'ExternalCore') compile: 'forceWarning ^self'.	"dirty the package"
  modifiedPackages := MCWorkingCopy allManagers
    select: [ :each | each modified ].
  Transcript
    cr;
    show:
        'Original Modified size: ' , originalModifiedPackages size printString
            , ' Modified size: ' , modifiedPackages size printString.
  self assert: modifiedPackages size > originalModifiedPackages size.
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