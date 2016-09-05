tests
testGroupMergeSpec
  | groupA groupB group |
  Transcript
    cr;
    show:
        'MetacelloScriptingStdTstHarness>>testGroupMergeSpec: '
            , UndefinedSymbolList printString.
  groupA := self groupSpec
    name: 'Platform';
    includes: 'Core';
    yourself.
  groupB := self groupSpec
    name: 'Platform';
    includes: 'Tests';
    yourself.
  group := groupA mergeSpec: groupB.
  self assert: (group includes includes: 'Core').
  self assert: (group includes includes: 'Tests')