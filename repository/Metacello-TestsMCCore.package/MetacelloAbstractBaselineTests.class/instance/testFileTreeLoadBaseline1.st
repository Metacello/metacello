tests
testFileTreeLoadBaseline1
  Metacello new
    baseline: 'ExternalX';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load