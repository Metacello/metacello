versions
version10beta3215: spec
  <version: '1.0.0-beta.32.15'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '1.0-beta.32.15: backport PR #257, Issue #227 and Issue #226
  https://github.com/dalehenrich/metacello-work/issues?q=milestone%3A1.0.0-beta.32.15+is%3Aclosed'.
      spec author: 'dkh'.
      spec timestamp: '9/26/2014 16:43'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:c1da7f8098b8759f806aaa952817709b767ed590/repository' ];
        import: 'Metacello' ]