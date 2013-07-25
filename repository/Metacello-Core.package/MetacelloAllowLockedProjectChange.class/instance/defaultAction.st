exception handling
defaultAction
  ^ MetacelloLockedProjectError
    signal:
      'Attempt to perform' , self operationString printString
        , ' on a locked project: '
        , self existingProjectRegistration printString