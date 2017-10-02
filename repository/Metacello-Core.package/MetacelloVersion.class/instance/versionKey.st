querying
versionKey
    "version printString, without the versionStatus decorations, suitable for using as a unique key for the 
	 receiver in a dictionary"

    | stream label |
    stream := WriteStream on: String new.
    self versionNumber printOn: stream.
    self basicSpec ~~ nil
      ifTrue: [ 
        (label := self projectLabel) isEmpty
          ifFalse: [ stream nextPutAll: ' [' , label , ']' ] ].
    ^ stream contents
