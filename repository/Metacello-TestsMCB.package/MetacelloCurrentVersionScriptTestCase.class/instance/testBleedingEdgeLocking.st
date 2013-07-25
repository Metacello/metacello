tests
testBleedingEdgeLocking
  | wc sawLock |
  Metacello new
    project: 'Foo';
    className: 'MetacelloTestConfigurationOfFoo';
    version: #'bleedingEdge';
    lock.
  self
    should: [ 
      Metacello new
        project: 'Fan';
        className: 'MetacelloTestConfigurationOfFan';
        version: '5.0';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'Foo' ]
    raise: Warning.
  sawLock := false.
  Metacello new
    project: 'Fan';
    className: 'MetacelloTestConfigurationOfFan';
    version: '5.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    onLock: [ :ex :existing :new | 
          existing projectName = 'Foo'
            ifTrue: [ sawLock := true ].
          ex pass ];
    load: 'Foo'.
  self assert: sawLock.
  wc := (GoferPackageReference name: 'GoferFaux') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFaux-tg.32'.
  wc := (GoferPackageReference name: 'GoferBeau') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferBeau-dkh.55'