versions
version10beta3201: spec
    <version: '1.0-beta.32.1'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'release'.
            spec
                description:
                    'successful Pier3AddOns 3.0.2 load using scripting api!
  https://github.com/dalehenrich/metacello-work/commit/508399fbfa70a4fe64799893aa10a66f0b302ff5'.
            spec author: 'dkh'.
            spec timestamp: '6/16/2012 11:13' ].
    spec
        for: #'pharo'
        do: [ 
            spec
                baseline: 'Metacello'
                with: [ spec repository: 'github://dalehenrich/metacello-work:508399fbfa70a4fe64799893aa10a66f0b302ff5/repository' ] ]