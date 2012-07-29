versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'release'.
            spec description: 'initial preview release'.
            spec author: 'dkh'.
            spec timestamp: '7/29/2012 07:34'.
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:cecd1626d27f67175f22e6075ca2d1177da1d525/repository' ];
                import: 'Metacello' ]