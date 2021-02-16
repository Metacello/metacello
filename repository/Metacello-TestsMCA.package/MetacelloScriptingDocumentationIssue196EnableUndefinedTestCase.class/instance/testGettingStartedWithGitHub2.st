tests
testGettingStartedWithGitHub2
  Metacello new
    baseline: 'External';
    githubUser: 'dalehenrich' project: 'external' commitish: MetacelloScriptingResource externalCustomSHA path: 'repository';
    load.
  Metacello image
    baseline: 'External';
    get;
    load