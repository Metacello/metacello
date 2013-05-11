as yet unclassified
testConfigurationThenBaselineMNU
  "https://github.com/dalehenrich/metacello-work/issues/156"

  "MNU for #compareEqual:
    - preload BaselineOfGoo package
    - load ConfigurationOfGoo indirectly through ConfigurationOfProjectGoo
    - attempt to load BaselineOfGoo indirectly through ConfigurationOfProjectGoo"

  | failed |
  Gofer new
    repository: mczConfigurationRepository;
    package: 'ConfigurationOfProjectGoo';
    package: 'ConfigurationOfGoo';
    package: 'BaselineOfGoo';
    load.
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
  self assert: failed