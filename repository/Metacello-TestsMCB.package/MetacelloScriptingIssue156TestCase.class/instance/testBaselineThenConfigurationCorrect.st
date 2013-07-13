as yet unclassified
testBaselineThenConfigurationCorrect
  "https://github.com/dalehenrich/metacello-work/issues/156"

  "Correct behavior
    - load BaselineOfGoo indirectly through ConfigurationOfProjectGoo
    - load ConfigurationOfGoo indirectly through ConfigurationOfProjectGoo
    - signal a MetacelloAllowConflictingProjectUpgrade
   configuration may not trump baseline"

  | triggered |
  Metacello new
    configuration: 'ProjectGoo';
    version: '1.1.0';
    repository: 'dictionary://Metacello_MczConfiguration_Test_Repository';
    silently;
    load.
  triggered := false.
  [ 
  Metacello new
    configuration: 'ProjectGoo';
    version: '1.0.0';
    repository: 'dictionary://Metacello_MczConfiguration_Test_Repository';
    silently;
    load ]
    on: MetacelloAllowConflictingProjectUpgrade
    do: [ :ex | 
      self
        assert:
          ex existingProjectRegistration baselineProjectSpec className = 'BaselineOfGoo'.
      self
        assert:
          ex newProjectRegistration configurationProjectSpec className
            = 'ConfigurationOfGoo'.
      self assert: ex existingProjectRegistration configurationProjectSpec isNil.
      self assert: ex newProjectRegistration baselineProjectSpec isNil.
      triggered := true ].
  self assert: triggered