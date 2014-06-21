Issue 250
version20Issue250: spec
  <version: '2.0' imports: #('2.0-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec
        package: 'GoferBar' with: 'GoferBar-jf.1';
        package: 'GoferFoo' with: 'GoferFoo-lr.1';
        package: 'GeauxFoo' with: 'GeauxFoo-lr.1';
        yourself ]