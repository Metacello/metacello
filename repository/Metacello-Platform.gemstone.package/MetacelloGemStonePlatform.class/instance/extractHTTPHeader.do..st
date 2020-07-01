github support
extractHTTPHeader: aStream do: aBlock
  "read up to double newline"

  | line header payload parsingHeader |
  Transcript
    cr;
    show: 'start extractHTTPHeader:do:'.
  header := Dictionary new.
  payload := WriteStream on: String new.
  parsingHeader := true.
  line := aStream nextLine.	"strip status"
  Transcript
    cr;
    show: 'status?? ---> ' , line.
  [ aStream atEnd ]
    whileFalse: [ 
      line := aStream nextLine.
      Transcript
        cr;
        show: '---> ' , line.
      parsingHeader
        ifTrue: [ 
          line isEmpty
            ifTrue: [ 
              parsingHeader := false.
              Transcript
                cr;
                show: '======> start parsing payload' ]
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
  Transcript
    cr;
    show: 'end extractHTTPHeader:do:'.
  aBlock value: header value: payload contents