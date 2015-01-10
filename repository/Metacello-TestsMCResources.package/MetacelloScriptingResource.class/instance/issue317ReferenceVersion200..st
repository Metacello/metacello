issue 317
issue317ReferenceVersion200: spec
  "self reset"

  <version: '2.0.0'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        configuration: 'Issue317'
        with: [ 
          spec
            version: '2.0.0';
            repository: 'dictionary://Metacello_Configuration_Test_Repository' ] ]