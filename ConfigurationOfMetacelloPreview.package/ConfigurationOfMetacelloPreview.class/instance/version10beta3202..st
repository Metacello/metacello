versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'use import: statement'.
            spec author: 'dkh'.
            spec timestamp: '7/10/2012 20:45' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:f622a6387110eb3c2b28a4f2f3e2d118e8775c44/repository' ];
                import: 'Metacello' ]