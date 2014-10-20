tests
testGettingStartedWithGitHub1
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    load.
  Metacello image
    baseline: 'External';
    get;
    load