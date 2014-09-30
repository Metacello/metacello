tests
testLockCommandReference5
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#copy-packages-to-filetree-repository"

  Metacello new
    configuration: 'External';
    version: '1.0.0';
    repository: 'http://ss3.gemtalksystems.com/ss/external';
    cacheRepository: 'filetree://' , externalDirectory fullName;
    ignoreImage;
    fetch: 'ALL'