issue 317
issue317version200: spec
  "self reset"

  <version: '2.0.0'>
  spec
    for: #'common'
    do: [ 
      spec repository: 'dictionary://Metacello_Gofer_Test_Repository'.
      spec
        package: 'GoferFoo' with: 'GoferFoo-lr.4';
        package: 'GoferFaux' with: 'GoferFaux-tg.35';
        yourself ]