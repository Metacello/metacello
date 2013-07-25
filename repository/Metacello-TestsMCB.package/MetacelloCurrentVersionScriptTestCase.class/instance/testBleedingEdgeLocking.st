tests
testBleedingEdgeLocking
  | wc |
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
  Metacello new
    project: 'Fan';
    className: 'MetacelloTestConfigurationOfFan';
    version: '5.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    onUpgrade: [ :ex :existing :new | 
          existing projectName = 'Foo'
            ifTrue: [ 
              "use locked version"
              ex disallow ].
          ex pass ];
    load: 'Foo'.
  wc := (GoferPackageReference name: 'GoferFaux') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferFaux-tg.32'.
  wc := (GoferPackageReference name: 'GoferBeau') workingCopy.
  self assert: wc ancestry ancestors first name = 'GoferBeau-dkh.55'