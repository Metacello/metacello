tests
testBaseline10LoadAtomic
  | project version wc |
  project := self project.
  version := project version: '1.0-baseline'.
  version load.
  wc := (GoferPackageReference name: 'GoferFoo') workingCopy.
  Transcript
    cr;
    show:
        'testBaseline10LoadAtomic [0]: ' , wc ancestry ancestors first name printString.
  self assert: wc ancestry ancestors first name = 'GoferFoo-dkh.5'.
  wc := (GoferPackageReference name: 'GoferBeau') workingCopy.
  Transcript
    cr;
    show:
        'testBaseline10LoadAtomic [1]: ' , wc ancestry ancestors first name printString.
  self assert: wc ancestry ancestors first name = 'GoferBeau-dkh.15'.
  wc := (GoferPackageReference name: 'GoferBar') workingCopy.
  Transcript
    cr;
    show:
        'testBaseline10LoadAtomic [2]: ' , wc ancestry ancestors first name printString.
  self assert: wc ancestry ancestors first name = 'GoferBar-dkh.1'