running
setupDocumentationRepositories
  Metacello new
    baseline: 'Alternate';
    repository: 'github://dalehenrich/alternate:Issue_metacello_196/repository';
    cacheRepository: 'filetree://' , alternateDirectory fullName;
    ignoreImage;
    get;
    fetch: 'ALL'.
  alternateRepository := MCFileTreeRepository new directory: alternateDirectory.
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:master/repository';
    cacheRepository: 'filetree://' , externalDirectory fullName;
    ignoreImage;
    get;
    fetch: 'ALL'.
  externalRepository := MCFileTreeRepository new directory: externalDirectory.
  Metacello new
    baseline: 'Sample';
    repository: 'github://dalehenrich/sample:master/repository';
    cacheRepository: 'filetree://' , sampleDirectory fullName;
    ignoreImage;
    get;
    fetch: 'ALL'.
  sampleRepository := MCFileTreeRepository new directory: sampleDirectory