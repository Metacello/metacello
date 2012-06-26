test import
testFie25Loada
    Metacello new
        project: 'Fie';
        className: 'MetacelloTestConfigurationOfProjectFie';
        version: '2.5';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load.
    self verify: 'GoferFoo' version: 'GoferFoo-lr.1'.
    self verify: 'GoferBar' version: 'GoferBar-lr.0'.
    self verify: 'GoferFaux' version: 'GoferFaux-tg.31'.
    self verify: 'GoferBeau' version: 'GoferBeau-dkh.54'