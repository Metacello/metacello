versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec author: 'dkh'.
            spec timestamp: '7/26/2012 22:56' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:0e499d1ae00fc2b995fb4c50b8e3d07d2be569f3/repository' ];
                import: 'Metacello' ]