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
  https://github.com/dalehenrich/metacello-work/issues/176
- fix Issue #181: The case for `unconditional` baseline loading
  https://github.com/dalehenrich/metacello-work/issues/181'.
      spec author: 'dkh'.
      spec timestamp: '7/16/2013 22:15'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:692e9c659810d40062aa63506b6875db76ec90e9/repository' ];
        import: 'Metacello' ]