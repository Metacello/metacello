versions
version10beta3213: spec
  <version: '1.0.0-beta.32.13'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: '1.0-beta.32.13 in support of tODE
  https://github.com/dalehenrich/metacello-work/issues?direction=desc&milestone=17&page=1&sort=updated&state=closed'.
      spec author: 'dkh'.
      spec timestamp: '7/5/2014 12:09'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:002d8f604bba6b86ed8e231a0bfcc809d3a6d787/repository' ];
        import: 'Metacello' ]