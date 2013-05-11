as yet unclassified
testConfigurationThenBaselineNoPreload
  "https://github.com/dalehenrich/metacello-work/issues/156"

  "If you don't preload BaselineOfGoo package the MNU for compareEqual: doesn't happen?"

  | failed |
  Metacello new
    configuration: 'ProjectGoo';
    version: '1.0.0';
    repository: 'dictionary://Metacello_MczConfiguration_Test_Repository';
    silently;
    load.
  failed := false.
  [ 
  Metacello new
    configuration: 'ProjectGoo';
    version: '1.1.0';
    repository: 'dictionary://Metacello_MczConfiguration_Test_Repository';
    silently;
    load ]
    on: MessageNotUnderstood
    do: [ :ex | 
      ex selector == #'compareEqual:'
        ifFalse: [ ex pass ].
      failed := true ].
  self deny: failed	"if we don't preload the baseline, we don't get the compareEqual: error ... need to understand this before calling this issue closed"