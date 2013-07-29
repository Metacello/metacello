exception handling
defaultAction
  Warning
    signal:
      'LOCK ENFORCED: Attempt to ' , self operationString printString
        , ' new project: ' , self newProjectRegistration printString
        , ' when existing project: '
        , self existingProjectRegistration printString
        , ' is locked. New project not loaded.'.
  ^ self disallow