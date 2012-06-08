private
validateBlockFie35FeauxLoad
    ^ [ 
    self validateOriginalBlockFie35FeauxLoad value.
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