printing
printOn: aStream

    | stream |
    stream := WriteStream on: String new.
    self printOn: stream.
    ^stream contents
