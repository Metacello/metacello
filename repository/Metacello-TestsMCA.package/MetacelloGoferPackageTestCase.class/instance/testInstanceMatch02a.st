tests
testInstanceMatch02a
  self
    deny:
      ((MetacelloGoferPackage name: 'GoferBar' packageFilename: 'GoferBar.branch-lr.2')
        matches: (GoferVersionReference name: 'GoferBar-lr,2'))