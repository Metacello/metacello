tests
testVersion10
  | x y |
  self
    assert:
      (x := ((MetacelloPlatform current
        sort:
          {(self versionClass fromString: '1.0.0').
          (self versionClass fromString: '0.7.0').
          (self versionClass fromString: '0.8.0').
          (self versionClass fromString: '0.9.0').
          (self versionClass fromString: '1.0.1')}
        with: [ :a :b | a <= b ]) collect: [ :each | each versionString ])
        asArray) = (y := #('0.7.0' '0.8.0' '0.9.0' '1.0.0' '1.0.1'))