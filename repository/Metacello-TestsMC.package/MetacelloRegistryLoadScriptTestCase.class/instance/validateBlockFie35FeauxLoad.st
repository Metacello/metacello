private
validateBlockFie35FeauxLoad
    ^ [ 
    self verify: 'GeauxFoo' version: 'GeauxFoo-lr.1'.
    self verify: 'GeauxBar' version: 'GeauxBar.branch-lr.2'.
    self
        validateProjects:
            {{'Fie'.
            '3.5'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Feaux'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}} ]