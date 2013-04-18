versions
version10beta3204: spec
    <version: '1.0.0-beta.32.4'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'release'.
            spec description: 'Synchronize with Metacello 1.0-beta.32 (dkh.752)'.
            spec author: 'dkh'.
            spec timestamp: '3/6/2013 14:12'.
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://demarey/metacello-work:cb302971072e4a27f259d92768f88034dd727a0b/repository' ];
                import: 'Metacello' ]
