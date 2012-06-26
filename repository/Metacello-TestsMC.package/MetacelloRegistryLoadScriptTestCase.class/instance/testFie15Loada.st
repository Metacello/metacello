test import
testFie15Loada
    Metacello new
        project: 'Fie';
        className: 'MetacelloTestConfigurationOfProjectFie';
        version: '1.5';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'GeauxBar'.
    self
        verify: 'GeauxBar' version: 'GeauxBar.branch-lr.2';
        verify: 'GoferFoo' version: 'GoferFoo-lr.1';
        verify: 'GoferBar' version: 'GoferBar-lr.0'.
    self
        verifyPackageNotLoaded: 'GoferBeau';
        verifyPackageNotLoaded: 'GoferFaux'