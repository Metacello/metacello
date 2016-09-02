ConfigurationOfFoo
postloadDoIt
  "self reset"

  Metacello current
    globalNamed: #'Metacello_Configuration_Test_POST_DoIt_Result'
    put: true