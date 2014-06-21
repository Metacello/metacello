Issue 250
baselineVersion21Issue250: spec
  <version: '2.1-baseline'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec repository: 'dictionary://Metacello_Gofer_Test_Repository'.
      spec
        package: 'GoferBar';
        package: 'GoferFoo';
        yourself ]