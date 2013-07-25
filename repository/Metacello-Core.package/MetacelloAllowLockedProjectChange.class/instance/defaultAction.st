exception handling
defaultAction
  ^ Warning
    signal:
      'Attempt to perform' , self operationString printString
        , ' on a locked project: '
        , self existingProjectRegistration printString