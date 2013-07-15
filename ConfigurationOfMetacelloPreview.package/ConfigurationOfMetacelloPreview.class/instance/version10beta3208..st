versions
version10beta3208: spec
  <version: '1.0.0-beta.32.8'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '- fix google Issue 184: github zip download failures due to filesystem issues
  https://code.google.com/p/metacello/issues/detail?id=184
- fix Issue #175: MCGitHubRepository and cache
  https://github.com/dalehenrich/metacello-work/issues/175
- fix Issue #174: `lock` should work with symbolic versions
  https://github.com/dalehenrich/metacello-work/issues/174
- fix Issue #176: attempt to modify immutable project spec
  https://github.com/dalehenrich/metacello-work/issues/176'.
      spec author: 'dkh'.
      spec timestamp: '7/15/2013 08:53'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:0fb887bec3302226a17d508ae01c1dd99cd0bf5c/repository' ];
        import: 'Metacello' ]