private
checkAllowed
    self existingProjectRegistration locked
        ifTrue: [ 
            MetacelloLockedProjectError
                signal:
                    'Attempt to perform' , self operationString printString , ' a locked project: '
                        , self existingProjectRegistration printString ]