running
tearDown
  #(#'ConfigurationOfProjectConfigIssue283' #'ConfigurationOfProjectIssue283')
    do: [ :className | 
      (MetacelloProjectRegistration
        registrationForClassNamed: className
        ifAbsent: [  ])
        ifNotNil: [ :registration | registration unregisterProject ] ].
  super tearDown