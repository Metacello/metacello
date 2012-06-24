versions
version10beta3202: spec
    <version: '1.0.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'release'.
            spec
                description:
                    'use /usr/bin/unzip to extract archive
  https://github.com/dalehenrich/metacello-work/commit/1497087b787bc574cfb76dcd17c272b27e37556a'.
            spec author: 'dkh'.
            spec timestamp: '6/24/2012 12:37' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                baseline: 'Metacello'
                    with: [ 
                            spec
                                loads: #('batch');
                                repository:
                                        'github://dalehenrich/metacello-work:1497087b787bc574cfb76dcd17c272b27e37556a/repository' ];
                project: 'batch' copyFrom: 'Metacello' with: [ spec loads: 'batch' ];
                project: 'Tests' copyFrom: 'Metacello' with: [ spec loads: 'Tests' ];
                yourself.
            spec group: 'default' with: #('batch') ]