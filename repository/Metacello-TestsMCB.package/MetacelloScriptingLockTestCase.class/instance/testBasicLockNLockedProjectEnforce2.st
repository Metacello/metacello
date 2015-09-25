tests
testBasicLockNLockedProjectEnforce2
  | sawLock |
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    lock.
  sawLock := false.
  Metacello new
    configuration: 'LockConfigurations';
    version: '1.1.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    onLock: [ :ex | 
          sawLock := true.
          ex pass ];
    onUpgrade: [ :ex :existing :new | 
          existing baseName = 'ExternalX'
            ifTrue: [ ex disallow	"lock not triggered" ].
          ex pass ];
    load.
  self deny: sawLock.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'dictionary://Metacello_Config_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil