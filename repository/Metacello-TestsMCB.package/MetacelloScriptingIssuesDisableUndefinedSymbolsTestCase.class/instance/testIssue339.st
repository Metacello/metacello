tests
testIssue339
  "https://github.com/dalehenrich/metacello-work/issues/339"

  Metacello new
    configuration: 'Issue339';
    version: '1.0.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  self verify: 'Issue339' version: 'Issue339-JanKurs.1'