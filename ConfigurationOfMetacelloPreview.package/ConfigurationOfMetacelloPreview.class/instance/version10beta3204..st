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
                                        'github://dalehenrich/metacello-work:6fb14916d605429808f10bb2bc90be8f320beb42/repository' ];
                import: 'Metacello' ]