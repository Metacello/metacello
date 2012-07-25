versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'use import: statement'.
            spec author: 'dkh'.
            spec timestamp: '7/25/2012 11:32' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:72944619d66f8546fcdfe536adb8fd966a578cf6/repository' ];
                import: 'Metacello' ]