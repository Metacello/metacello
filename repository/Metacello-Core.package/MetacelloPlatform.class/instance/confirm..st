accessing
confirm: aString
  self
    globalNamed: #'UIManager'
    ifPresent: [ :cl | ^ cl default perform: #'confirm:' with: aString ] Warning
    signal: aString.	"throw warning and answer true, if no way to announce"
  ^ true
