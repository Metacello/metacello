tests
testCompareCurrentVersion
    Metacello new
        project: 'Feaux';
        className: 'MetacelloTestConfigurationOfFeaux';
        version: '4.0';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'GeauxFoo'.
    self verify: 'GeauxFoo' loadedFrom: 'dictionary://Metacello_Gofer_Test_Repository'.
    self
        validateProjects:
            {{'MetacelloTestConfigurationOfFeaux'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil.
            nil}}.
    Metacello new
        project: 'Project Foe';
        className: 'MetacelloTestConfigurationOfProjectFoe';
        version: '4.0';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: 'ALL'.
    self verify: 'GeauxFoo' loadedFrom: 'dictionary://Metacello_Gofer_Test_Repository'.
    self verify: 'GoferFoo' loadedFrom: 'dictionary://Metacello_Gofer_Test_Repository'.
    self verify: 'GoferBar' loadedFrom: 'dictionary://Metacello_Gofer_Test_Repository'.
    self
        validateProjects:
            {{'MetacelloTestConfigurationOfFeaux'.
            'Feaux'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil.
            nil}.
            {'MetacelloTestConfigurationOfProjectFoe'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil.
            nil}.
            {'MetacelloTestConfigurationOfFoo'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil.
            nil}}