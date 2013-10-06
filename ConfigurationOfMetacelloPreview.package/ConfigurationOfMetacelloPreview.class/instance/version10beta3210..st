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
  https://github.com/dalehenrich/metacello-work/pull/207'.
      spec author: 'dkh'.
      spec timestamp: '10/5/2013 17:10'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:1c8c138a7be20910c6498a278367be2849212926/repository' ];
        import: 'Metacello' ]