test import
testFie25Loadc
    Metacello new
        project: 'Fie';
        className: 'MetacelloTestConfigurationOfProjectFie';
        version: '2.5';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'GoferBeau'.
    self verify: 'GoferBeau' version: 'GoferBeau-dkh.54'.
    self
        verifyPackageNotLoaded: 'GoferBar';
        verifyPackageNotLoaded: 'GoferFoo';
        verifyPackageNotLoaded: 'GoferFaux'