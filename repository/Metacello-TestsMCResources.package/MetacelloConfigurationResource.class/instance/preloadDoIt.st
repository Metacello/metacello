ConfigurationOfFoo
preloadDoIt
  "self reset"

  Metacello current
    globalNamed: #'Metacello_Configuration_Test_DoIt_Result'
    put: true