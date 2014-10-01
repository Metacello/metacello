tests
testLockCommandReference6
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#lock-the-projects"

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