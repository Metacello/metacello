options api
classic
    "see Metacello class>classic for correct application of this option"

    ^ self options at: #'classic' ifAbsent: [ false ]