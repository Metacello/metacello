tests
testSortWith
  | platform |
  platform := MetacelloPlatform current.
  {{{4.
  3.
  2.
  1}.
  #(1 2 3 4)}.
  {{'b'.
  'a'.
  'd'.
  'c'}.
  #('a' 'b' 'c' 'd')}}
    do: [ :ar | 
      | actual expected |
      actual := ar at: 1.
      expected := ar at: 2.
      self
        assert:
          (platform sort: actual with: [ :a :b | a <= b ]) asArray = expected ]