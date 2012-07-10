versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'pick up fix for Issue #39 from master branch'.
            spec author: 'dkh'.
            spec timestamp: '7/10/2012 11:02' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:4b3525112b4b4a5d5d58943453cad8d0d4b1a1fb/repository' ];
                project: 'batch' copyFrom: 'Metacello' with: [ spec loads: 'batch' ];
                project: 'Tests' copyFrom: 'Metacello' with: [ spec loads: 'Tests' ];
                yourself.
            spec group: 'default' with: #('batch') ]