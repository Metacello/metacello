versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec author: 'dkh'.
            spec timestamp: '7/26/2012 22:56'.
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:adf40828f992e1ea342888fad18f6fcc633b82de/repository' ];
                import: 'Metacello' ]