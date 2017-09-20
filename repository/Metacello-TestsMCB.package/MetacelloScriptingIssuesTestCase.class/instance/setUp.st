running
setUp
    super setUp.
    Smalltalk globals removeKey: #'Metacello_Configuration_Test_POST_DoIt_Result' ifAbsent: [  ].
    Smalltalk globals removeKey: #'Metacello_Configuration_Test_DoIt_Result' ifAbsent: [  ]