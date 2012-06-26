ConfigurationOfProjectFie
baseline15ProjectFie: spec
    "self reset"

    <version: '1.5'>
    spec
        for: #'common'
        do: [ 
            spec
                configuration: 'Foo'
                    with: [ 
                            spec
                                className: 'MetacelloTestConfigurationOfFoo';
                                versionString: '3.5';
                                repository: 'dictionary://Metacello_Configuration_Test_Repository' ];
                package: 'GeauxBar'
                    with: [ 
                            spec
                                repository: 'dictionary://Metacello_Gofer_Test_Repository';
                                requires: '1' ];
                import: 'Foo' ]