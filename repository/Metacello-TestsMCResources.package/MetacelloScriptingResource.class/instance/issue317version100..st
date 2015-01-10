issue 317
issue317version100: spec
  "self reset"

  <version: '1.0.0'>
  spec
    for: #'common'
    do: [ 
      spec repository: 'dictionary://Metacello_Gofer_Test_Repository'.
      spec
        package: 'GoferFoo' with: 'GoferFoo-lr.1';
        package: 'GoferFaux' with: 'GoferFaux-tg.30';
        yourself ]