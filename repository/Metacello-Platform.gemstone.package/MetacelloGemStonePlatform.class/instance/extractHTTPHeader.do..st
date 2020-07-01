github support
extractHTTPHeader: aStream do: aBlock
  "read up to double newline"

  | line header payload parsingHeader |
  header := Dictionary new.
  payload := WriteStream on: String new.
  parsingHeader := true.
  line := aStream nextLine.	"strip status"
  [ aStream atEnd ]
    whileFalse: [ 
      line := aStream nextLine.
      Transcript
        cr;
        show: '---> ' , line.
      parsingHeader
        ifTrue: [ 
          line isEmpty
            ifTrue: [ parsingHeader := false ]
            ifFalse: [ 
              | colonIndex key value |
              colonIndex := line indexOf: $:.
              key := (line copyFrom: 1 to: colonIndex - 1) trimBoth.
              value := (line copyFrom: colonIndex + 1 to: line size) trimBoth.
              header at: key put: value ] ]
        ifFalse: [ 
          payload
            nextPutAll: line;
            cr ] ].
  aBlock value: header value: payload contents