accessing
customProjectAttributes
  true
    ifTrue: [ ^ #() ].
  (Metacello respondsTo: #'isMetacelloNativeInstall')
    ifTrue: [ (Metacello perform: #'isMetacelloNativeInstall')
        ifTrue: [ ^ #(#'extension') ] ].
  ^ #(#'native')