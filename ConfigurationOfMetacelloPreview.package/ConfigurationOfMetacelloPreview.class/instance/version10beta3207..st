versions
version10beta3207: spec
  <version: '1.0.0-beta.32.7'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '-synchronize with current 1.0-beta.32.1
- fix Issue #172: Metacello-Base bootstrap code and configurations should reference seaside.gemtalksystems.com repos
  https://github.com/dalehenrich/metacello-work/issues/172'.
      spec author: 'dkh'.
      spec timestamp: '6/30/2013 12:31'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:2fe0913fb619f7ab82ea8fc975d7d54a94c92622/repository' ];
        import: 'Metacello' ]