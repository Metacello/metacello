versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'pick up fix for Issue #62 from master branch'.
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
                                        'github://dalehenrich/metacello-work:17cabeca3a0fc08ef0625ab46a1da630afe28da7/repository' ];
                project: 'batch' copyFrom: 'Metacello' with: [ spec loads: 'batch' ];
                project: 'Tests' copyFrom: 'Metacello' with: [ spec loads: 'Tests' ];
                yourself.
            spec group: 'default' with: #('batch') ]
