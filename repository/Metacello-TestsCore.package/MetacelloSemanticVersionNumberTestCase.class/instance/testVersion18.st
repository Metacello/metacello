tests
testVersion18
    | x y |
    self deny: (x := self versionClass fromString: '1.0') < (y := self versionClass fromString: '1-0').
    self assert: (x := self versionClass fromString: '1.0') > (y := self versionClass fromString: '1-0').
    self deny: (self versionClass fromString: '1.0') < (self versionClass fromString: '1').
    self assert: (x := self versionClass fromString: '1.0') < (y := self versionClass fromString: '1+0').
    self deny: (x := self versionClass fromString: '1.0') > (y := self versionClass fromString: '1+0')