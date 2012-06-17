versions
version10beta3202: spec
    <version: '1.0-beta.32.2'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'release'.
            spec
                description:
                    'use /usr/bin/unzip to extract archive
  https://github.com/dalehenrich/metacello-work/commit/1497087b787bc574cfb76dcd17c272b27e37556a'.
            spec author: 'dkh'.
            spec timestamp: '6/16/2012 20:33' ].
    spec
        for: #'pharo'
        do: [ 
            spec
                baseline: 'Metacello'
                with: [ spec repository: 'github://dalehenrich/metacello-work:1497087b787bc574cfb76dcd17c272b27e37556a/repository' ] ]