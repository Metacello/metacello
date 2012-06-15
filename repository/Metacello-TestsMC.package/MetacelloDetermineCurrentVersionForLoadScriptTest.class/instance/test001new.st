tests
test001new
    | wc |
    Metacello new
        project: 'Foo';
        version: '3.0';
        className: 'MetacelloTestConfigurationOfFoo';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load: #('GoferBar' 'GoferFaux').
    Metacello new
        project: 'Fan';
        version: '2.0';
        className: 'MetacelloTestConfigurationOfFan';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        onDowngrade: [ :ex :existing :new | 
                    self assert: new configurationProjectSpec className = 'MetacelloTestConfigurationOfFoo'.
                    self assert: new version = '2.0'.
                    self assert: new configurationProjectSpec loads = #('GoferFaux' 'GoferBeau').
                    self halt.	"problem is that we're fetching the correct spec, but it is not getting loaded, so we've got something wrong with the loader itself, being morphed into a fetching loader instead of a loading loader.. whew...put halt in MetacelloProjectSpecForLoad>>performLoad... "
                    ex disallow ];
        load: 'Foo'.
    wc := (GoferPackageReference name: 'GoferBar') workingCopy.
    self assert: wc ancestry ancestors first name = 'GoferBar.branch-lr.1'.
    wc := (GoferPackageReference name: 'GoferBeau') workingCopy.
    self assert: wc ancestry ancestors first name = 'GoferBeau-dkh.25'.
    wc := (GoferPackageReference name: 'GoferFaux') workingCopy.
    self assert: wc ancestry ancestors first name = 'GoferFaux-tg.30'.
    wc := (GoferPackageReference name: 'GoferBeau') workingCopy.
    self assert: wc ancestry ancestors first name = 'GoferBeau-dkh.53'