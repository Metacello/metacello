test import
testFie25Loadb
    Metacello new
        project: 'Fie';
        className: 'MetacelloTestConfigurationOfProjectFie';
        version: '2.5';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: '1'.
    self
        verify: 'GoferFoo' version: 'GoferFoo-lr.1';
        verify: 'GoferBar' version: 'GoferBar-lr.0'.
    self
        verifyPackageNotLoaded: 'GoferFaux';
        verifyPackageNotLoaded: 'GoferBeau'