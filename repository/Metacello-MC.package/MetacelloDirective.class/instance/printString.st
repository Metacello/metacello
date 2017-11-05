printing
printString
	"Explicit override of superclass implementation. When you are printing a loadDirective it is annoying to have it truncated."

    | stream |
    stream := WriteStream on: String new.
    self printOn: stream.
    ^stream contents
