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
------EXPERIMENT'.
      spec author: 'dkh'.
      spec timestamp: '10/5/2013 17:10'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:1d689e009620597463da39a2bd4e083de3b46930/repository' ];
        import: 'Metacello' ]
