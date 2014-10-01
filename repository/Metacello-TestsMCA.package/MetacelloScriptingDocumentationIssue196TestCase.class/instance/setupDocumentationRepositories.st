running
setupDocumentationRepositories
  Metacello new
    baseline: 'Alternate';
    repository: 'github://dalehenrich/alternate:otto/repository';
    cacheRepository: 'filetree://' , alternateDirectory fullName;
    ignoreImage;
    fetch: 'ALL'.
  alternateRepository := MCFileTreeRepository new directory: alternateDirectory.
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:master/repository';
    cacheRepository: 'filetree://' , externalDirectory fullName;
    ignoreImage;
    fetch: 'ALL'.
  externalRepository := MCFileTreeRepository new directory: externalDirectory.
  Metacello new
    baseline: 'Sample';
    repository: 'github://dalehenrich/sample:master/repository';
    cacheRepository: 'filetree://' , sampleDirectory fullName;
    ignoreImage;
    fetch: 'ALL'.
  sampleRepository := MCFileTreeRepository new directory: sampleDirectory