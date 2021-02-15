tests
testGettingStartedWithGitHub3
  Metacello new
    baseline: 'External';
    githubUser: 'dalehenrich' project: 'external' path: 'repository';
    load.
  Metacello image
    baseline: 'External';
    get;
    load