versions
version10beta3214: spec
  <version: '1.0.0-beta.32.14'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '1.0-beta.32.14 in support of tODE
  https://github.com/dalehenrich/metacello-work/issues?direction=desc&milestone=18&page=1&sort=updated&state=closed'.
      spec author: 'dkh'.
      spec timestamp: '7/6/2014 16:12'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:257433ce59f6e856669753a34ba13498fb382b78/repository' ];
        import: 'Metacello' ]