tests
testIssue294
  "https://github.com/dalehenrich/metacello-work/issues/294"

  Metacello new
    baseline: 'Alternate';
    repository: 'github://dalehenrich/alternate:otto/repository';
    cacheRepository: 'filetree://' , alternateDirectory fullName;
    get.
  alternateRepository := MetacelloPlatform current
    repositoryFromUrl: ('filetree://' , alternateDirectory fullName) asUrl.
  alternateRepository allFileNames
    detect: [ :packageName | packageName beginsWith: 'BaselineOfAlternate' ]
    ifNone: [ self assert: false ]