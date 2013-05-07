versions
version10beta3206: spec
  <version: '1.0.0-beta.32.6'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec
        description:
          'Checkpoint release to make bugfix for Issue #65 available (https://github.com/dalehenrich/metacello-work/issues/65) ... Port Metacello to Pharo-2.0'.
      spec author: 'dkh'.
      spec timestamp: '5/7/2013 08:22'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:22385dff3003e00239634fa306b424fdecc26b57/repository' ];
        import: 'Metacello' ]