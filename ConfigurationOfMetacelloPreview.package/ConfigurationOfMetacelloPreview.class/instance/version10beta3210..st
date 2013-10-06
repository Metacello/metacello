versions
version10beta3210: spec
  <version: '1.0.0-beta.32.10'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '- Pharo3.0 Support Issue #187 and Pull request: #207
  https://github.com/dalehenrich/metacello-work/issues/187
  https://github.com/dalehenrich/metacello-work/pull/207
- fix Issue #210: MetacelloProjectRegistry>>primeRegistryFromImage introduces `invalid` registrations
  https://github.com/dalehenrich/metacello-work/issues/210'.
      spec author: 'dkh'.
      spec timestamp: '10/6/2013 12:12'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:9d7e7f8994abeb0b474ec54e9c8c714b3fe95fb9/repository' ];
        import: 'Metacello' ]