accessing
projectPlatformAttributesWith: platformAttributes
  ^ ((Metacello respondsTo: #'isMetacelloNativeInstall')
    ifTrue: [ (Metacello perform: #'isMetacelloNativeInstall')
        ifTrue: [ #(#'extension') ] ]
    ifFalse: [ #(#'native') ]) , platformAttributes