options api
ignoreImage
    "ignoreImage true by default in the Metacello scripting API"

    ^ self options at: #'ignoreImage' ifAbsent: [ true ]