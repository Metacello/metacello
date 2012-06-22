tests
testFie35Foo40FeauxLoadDisallow
    Metacello new
        project: 'Fie';
        className: 'MetacelloTestConfigurationOfProjectFie';
        version: '3.5';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'Foo'.
    self validateBlockFie35FooLoad value.
    Metacello new
        project: 'Fie';
        className: 'MetacelloTestConfigurationOfProjectFie';
        version: '4.0';
        onUpgrade: [ :ex | ex disallow ];
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'Feaux'.
    self validateBlockFie35FooFeuxLoad value