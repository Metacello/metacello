Issue 250
version21Issue250: spec
  <version: '2.1' imports: #('2.1-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec
        package: 'GoferBar' with: 'GoferBar-jf.1';
        package: 'GoferFoo' with: 'GoferFoo-lr.4';
        yourself ]