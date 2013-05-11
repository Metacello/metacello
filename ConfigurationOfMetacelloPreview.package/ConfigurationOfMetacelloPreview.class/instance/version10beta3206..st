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
- bootstrap from Metacello-Base needs to load Metacello-PharoCommonPlatform
- fix for Issue #156: MNU #compareEqual:
  https://github.com/dalehenrich/metacello-work/issues/156'.
      spec author: 'dkh'.
      spec timestamp: '5/11/2013 12:43'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:c53d8a7b197ffc4804deaade109ec013581f930f/repository' ];
        import: 'Metacello' ]