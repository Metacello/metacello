Issue 250
baselineVersion20Issue250: spec
  <version: '2.0-baseline'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec repository: 'dictionary://Metacello_Gofer_Test_Repository'.
      spec
        package: 'GoferBar';
        package: 'GoferFoo';
        package: 'GeauxFoo';
        yourself ]