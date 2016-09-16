tests
testFileTreeLoadBaseline1
  Metacello new
    baseline: 'ExternalX';
    repository:
        'filetree://'
            ,
              (MetacelloPlatform current fullNameForDirectory: externalDirectory);
    silently;
    load