tests
testLoadNGet
  "explicitly load ConfigurationOfExternalX-dkh.1 do load of 0.9.0, then get ... should have ConfigurationOfExternalX-dkh.2"

  [ 
  | projectSpec |
  Transcript
    cr;
    show:
        'testLoadNGet [0]: '
            ,
              (Smalltalk at: #'Metacello_Configuration_Test_Repository') description.
  Gofer new
    version: 'ConfigurationOfExternalX-dkh.1';
    repository: configurationRepository;
    load.
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.0';
    repository: 'dictionary://Metacello_XXX_Test_Repository';
    load.	"random failure here ... could not resolve BaselineOfExternalX in package-cache"
  Transcript
    cr;
    show: 'testLoadNGet [1]'.
  self
    verify: 'ConfigurationOfExternalX'
    version: 'ConfigurationOfExternalX-dkh.1'.
  projectSpec := (Metacello registry
    configuration: 'ExternalX';
    list) first.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = #('dictionary://Metacello_XXX_Test_Repository').
  Metacello new
    configuration: 'ExternalX';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    get.
  Transcript
    cr;
    show: 'testLoadNGet [2]'.
  self
    verify: 'ConfigurationOfExternalX'
    version: 'ConfigurationOfExternalX-dkh.2'.
  projectSpec := (Metacello registry
    configuration: 'ExternalX';
    list) first.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = #('dictionary://Metacello_Config_Test_Repository').
  Transcript
    cr;
    show: 'testLoadNGet [3]' ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testLoadNGet [4]: ' , ex description.
      (Smalltalk at: #'Metacello_Configuration_Test_Repository') dictionary keys
        do: [ :key | 
          Transcript
            cr;
            tab;
            show: key printString ].
      Transcript
        cr;
        show: 'testLoadNGet [5]'.
      (MCRepositoryGroup default repositories
        detect: [ :repo | repo description = 'Metacello_Configuration_Test_Repository' ]
        ifNone: [ 
          Transcript
            cr;
            show:
                'testLoadNGet [7]: ' , 'Metacello_Configuration_Test_Repository not found'.
          MCDictionaryRepository new ])
        dictionary keys
        do: [ :key | 
          Transcript
            cr;
            tab;
            show: key printString ].
      Transcript
        cr;
        show: 'testLoadNGet [6]'.
      ex pass ]