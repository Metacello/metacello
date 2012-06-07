private
validateBlockFie35FooFeuxLoad
    ^ [ 
    self verify: 'GoferFoo' version: 'GoferFoo-lr.1'.
    self verify: 'GoferBar' version: 'GoferBar-lr.0'.
    self verify: 'GoferFaux' version: 'GoferFaux-tg.31'.
    self verify: 'GoferBeau' version: 'GoferBeau-dkh.54'.
    self verify: 'GeauxFoo' version: 'GeauxFoo-lr.1'.
    self verify: 'GeauxBar' version: 'GeauxBar.branch-lr.2'.
    self
        validateProjects:
            {{'Fie'.
            '3.5'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Foo'.
            '3.5'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}.
            {'Feaux'.
            '4.0'.
            'dictionary://Metacello_Configuration_Test_Repository'.
            nil.
            nil}} ]