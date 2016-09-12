tests
testFindTokens
  | platform |
  platform := MetacelloPlatform current.
  self assert: (platform findTokens: '<>' in: '<abcdef>') asArray = {'abcdef'}.
  self
    assert:
      (platform findTokens: $| in: '|abcd|efgh') asArray
        =
          {'abcd'.
          'efgh'}.
  self
    assert:
      (platform findTokens: $| in: '|abcd|efgh|') asArray
        =
          {'abcd'.
          'efgh'}.
  self
    assert:
      (platform findTokens: $| in: '|abcd|efgh|||||ijk') asArray
        =
          {'abcd'.
          'efgh'.
          'ijk'}.
  self
    assert:
      (platform findTokens: $| in: 'abcd|efgh|||||ijk') asArray
        =
          {'abcd'.
          'efgh'.
          'ijk'}