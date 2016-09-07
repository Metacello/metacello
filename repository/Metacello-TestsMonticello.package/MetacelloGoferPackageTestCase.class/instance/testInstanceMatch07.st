tests
testInstanceMatch07
  "https://github.com/dalehenrich/metacello-work/issues/339"

  self
    assert:
      ((MetacelloGoferPackage name: 'Issue339' packageFilename: 'Issue339-JanKurs.1')
        matches: (GoferVersionReference name: 'Issue339-JanKurs.1')).
  self
    deny:
      ((MetacelloGoferPackage name: 'Issue339' packageFilename: 'Issue339-JanKurs.1')
        matches: (GoferVersionReference name: 'Issue339-JanKurs.11'))