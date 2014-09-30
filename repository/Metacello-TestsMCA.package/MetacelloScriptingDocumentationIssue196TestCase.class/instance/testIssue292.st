tests
testIssue292
  "https://github.com/dalehenrich/metacello-work/issues/292"

  | alternateDirectory |
  alternateDirectory := MetacelloPlatform current
    directoryFromPath: 'alternate'
    relativeTo: externalDirectory.
  MetacelloPlatform current ensureDirectoryExists: alternateDirectory.
  Metacello new
    baseline: 'Alternate';
    repository: 'github://dalehenrich/alternate:otto/repository';
    cacheRepository: 'filetree://' , alternateDirectory fullName;
    ignoreImage;
    fetch: 'ALL'