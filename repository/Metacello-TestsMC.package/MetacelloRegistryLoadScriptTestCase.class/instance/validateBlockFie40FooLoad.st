private
validateBlockFie40FooLoad
    ^ [ 
    self validateBlockOriginalFie40FooLoad value.
    self
        validateProjects:
            {{'Fie'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Foo'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}} ]