versions
version10beta3206: spec
  <version: '1.0.0-beta.32.6'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec
        description:
          'Checkpoint release to make bugfix for Issue #65 available (https://github.com/dalehenrich/metacello-work/issues/65) ... Port Metacello to Pharo-2.0
- workaround for SmalltalkHub Issue 21: corrupted package
  https://code.google.com/p/smalltalk-hub/issues/detail?id=21'.
      spec author: 'dkh'.
      spec timestamp: '5/7/2013 19:18'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:d59e5e1d14db6142e0e8451634252f24c09d30fa/repository' ];
        import: 'Metacello' ]