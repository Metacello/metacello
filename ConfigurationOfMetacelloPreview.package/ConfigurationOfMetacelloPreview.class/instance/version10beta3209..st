versions
version10beta3209: spec
  <version: '1.0.0-beta.32.9'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '- fix Issue #188: Problems using <version:imports:> for structural reasons
  https://github.com/dalehenrich/metacello-work/issues/188'.
      spec author: 'dkh'.
      spec timestamp: '7/23/2013 20:45'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:2ea5ae998b382cb13e8bde8f2c6d05b970cfb961/repository' ];
        import: 'Metacello' ]