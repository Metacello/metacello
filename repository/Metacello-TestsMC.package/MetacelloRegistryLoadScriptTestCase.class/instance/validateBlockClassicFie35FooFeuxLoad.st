private
validateBlockClassicFie35FooFeuxLoad
    ^ [ 
    self validateBlockOriginalFie4035FooFeuxLoad value.
    self
        validateProjects:
            {{'Fie'.
            '3.5'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Foo'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Feaux'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}} ]