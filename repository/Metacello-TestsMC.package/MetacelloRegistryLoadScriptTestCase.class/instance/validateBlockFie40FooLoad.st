private
validateBlockFie40FooLoad
    ^ [ 
    self verify: 'GoferFoo' version: 'GoferFoo-lr.1'.
    self verify: 'GoferBar' version: 'GoferBar-lr.0'.
    self verify: 'GoferFaux' version: 'GoferFaux-tg.32'.
    self verify: 'GoferBeau' version: 'GoferBeau-dkh.55'.
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