running
setupDocumentationRepositories
  Metacello new
    baseline: 'Alternate';
    repository: 'github://dalehenrich/alternate:Issue_metacello_196/repository';
    cacheRepository: 'filetree://' , alternateDirectory fullName;
    ignoreImage;
    get;
    fetch: 'ALL'.
  alternateRepository := (MetacelloPlatform current
    repositoryFromUrl: 'filetree://' , alternateDirectory fullName) asUrl.
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:master/repository';
    cacheRepository: 'filetree://' , externalDirectory fullName;
    ignoreImage;
    get;
    fetch: 'ALL'.
  externalRepository := (MetacelloPlatform current
    repositoryFromUrl: 'filetree://' , externalDirectory fullName) asUrl.
  Metacello new
    baseline: 'Sample';
    repository: 'github://dalehenrich/sample:master/repository';
    cacheRepository: 'filetree://' , sampleDirectory fullName;
    ignoreImage;
    get;
    fetch: 'ALL'.
  sampleRepository := (MetacelloPlatform current
    repositoryFromUrl: 'filetree://' , sampleDirectory fullName) asUrl