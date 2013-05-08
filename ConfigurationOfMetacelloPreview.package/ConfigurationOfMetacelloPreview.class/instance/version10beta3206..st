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
  https://code.google.com/p/smalltalk-hub/issues/detail?id=21
- bootstrap from Metacello-Base needs to load Metacello-PharoCommonPlatform'.
      spec author: 'dkh'.
      spec timestamp: '5/8/2013 00:33'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:95bfc25ecf961afefc13cf16e88bf16c54b102eb/repository' ];
        import: 'Metacello' ]