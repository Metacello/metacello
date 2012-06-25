versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'pick up fix for Issue #60 from master branch'.
            spec author: 'dkh'.
            spec timestamp: '6/24/2012 16:56' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:ac8fcd705b59ca36c4c72ac3a27de0ddcae3a768/repository' ];
                project: 'batch' copyFrom: 'Metacello' with: [ spec loads: 'batch' ];
                project: 'Tests' copyFrom: 'Metacello' with: [ spec loads: 'Tests' ];
                yourself.
            spec group: 'default' with: #('batch') ]