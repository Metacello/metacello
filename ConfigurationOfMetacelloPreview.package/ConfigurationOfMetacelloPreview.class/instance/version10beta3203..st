versions
version10beta3203: spec
    <version: '1.0.0-beta.32.3'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'release'.
            spec description: 'Synchronize with Metacello 1.0-beta.31.1.5'.
            spec author: 'dkh'.
            spec timestamp: '9/18/2012 14:36'.
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:bdb13998bf2399ca7f9027c566d8e5ba9e837d3f/repository' ];
                import: 'Metacello' ]