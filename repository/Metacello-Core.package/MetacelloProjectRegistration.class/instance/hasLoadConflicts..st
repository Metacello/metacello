testing
hasLoadConflicts: aProjectRegistration
  "5 combinations of loads with no load conflicts:
        No configs and baselines =
        configs = and no baselines
        configs = and baselines =
        configs = and no baseline loaded (self) with a baseline to load (aProjectRegistration)
        config loaded (self), no config to load (aProjectRegistration) and no baseline loaded(self) with a baseline to load (aProjectRegistration) "

  aProjectRegistration validate.
  self isValid
    ifFalse: [ ^ false ].
  (self projectSpec hasConflictWithProjectSpec: aProjectRegistration projectSpec)
    ifTrue: [ 
      "if the registration is not locked and not loaded, the there are no load conflicts"
      "see MetacelloAbstractBaselineTests>>testBasicBaselineLockNUnlockNload and MetacelloScriptingLockEnableUndefinedSymbolsTestCase>>testBasicBaselineLockNUnlockNload"
      ^ self locked or: [ self loadedInImage ] ].
  ^ false
