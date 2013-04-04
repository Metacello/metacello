versions
version10beta3205: spec
  <version: '1.0.0-beta.32.5'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          'Checkpoint release to make bugfix for Issue #136 available (https://github.com/dalehenrich/metacello-work/issues/136)'.
      spec author: 'dkh'.
      spec timestamp: 'dkh 4/3/2013 20:31'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:720e9f80740c23c6eaf1fb21e5eee90aaca27fb6/repository' ];
        import: 'Metacello' ]