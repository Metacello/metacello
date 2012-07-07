versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'pick up fix for Issue #67 from master branch'.
            spec author: 'dkh'.
            spec timestamp: '7/7/2012 09:41' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:abb7170c9e32f4d1e6601fabb8f948bf99461c9c/repository' ];
                project: 'batch' copyFrom: 'Metacello' with: [ spec loads: 'batch' ];
                project: 'Tests' copyFrom: 'Metacello' with: [ spec loads: 'Tests' ];
                yourself.
            spec group: 'default' with: #('batch') ]