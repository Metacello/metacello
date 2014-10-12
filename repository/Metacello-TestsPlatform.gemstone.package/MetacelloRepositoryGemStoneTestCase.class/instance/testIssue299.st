tests
testIssue299
  "execute without error ... verify that #trimWhiteSpace is implemented in base GemStone"

  | str |
  str := 'abcdefg'.
  self asser: str trimWhiteSpace equals: str