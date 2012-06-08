private
validateBlockFie40FeauxLoad
    ^ [ 
    self validateBlockOriginalFie40FeauxLoad value.
    self
        validateProjects:
            {{'Fie'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Feaux'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}} ]