running
testIssue317c
  "https://github.com/dalehenrich/metacello-work/issues/317"

  | wc |
  Metacello new
    configuration: 'ReferenceIssue317';
    version: '1.0.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    get;
    load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.1'.
  wc := (GoferPackageReference name: 'GoferFaux') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFaux-tg.30'.
  Metacello new
    configuration: 'ReferenceIssue317';
    version: '2.0.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.4'.
  wc := (GoferPackageReference name: 'GoferFaux') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFaux-tg.35'.
  Metacello new
    configuration: 'ReferenceIssue317';
    version: '1.0.0';
    onDowngrade: [ :ex :existing :new | 
          "new projectSpec operator: #'='."
          ex allow ];
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    get;
    load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFoo-lr.1'.
  wc := (GoferPackageReference name: 'GoferFaux') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFaux-tg.30'