tests
testFeaux40Loaded
    Metacello new
        project: 'Fum';
        className: 'MetacelloTestConfigurationOfFum';
        version: '4.0';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'Feaux'.
    self verify: 'GeauxFoo' loadedFrom: 'dictionary://Metacello_Gofer_Test_Repository'.
    self verify: 'GeauxBar' loadedFrom: 'dictionary://Metacello_Gofer_Test_Repository'.
    self
        validateProjects:
            {{'Fum'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Feaux'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}}