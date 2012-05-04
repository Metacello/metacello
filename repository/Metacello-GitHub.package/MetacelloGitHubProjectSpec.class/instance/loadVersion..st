loading
loadVersion: aVersionOrNil
    "Load the correct version of the project"

    | vrsn mcLoader list |
    vrsn := aVersionOrNil.
    vrsn == nil
        ifTrue: [ 
            [ vrsn := self version ]
                on: MetacelloVersionDoesNotExistError
                do: [ :ex | 
                    ^ (MetacelloProjectSpecLoadError projectSpec: self)
                        versionDoesNotExistException: ex;
                        signal:
                                'No version found for ' , self versionString printString , ' of ' , self className asString , ' because: '
                                        , ex description ] ].
    mcLoader := self loader copy.
    mcLoader operator: self operator.
    vrsn loader: mcLoader.
    list := (mcLoader ignoreImage
        ifTrue: [ self loadListForVersion: vrsn ]
        ifFalse: [ vrsn packageAndProjectNamesToLoad: (self loadListForVersion: vrsn) loader: mcLoader ]) asSet.
    mcLoader preLoad: self.
    (MetacelloLoadProjectSpecVersionNotification new
        projectSpec: self;
        versionString: self basicVersionString) signal.
    vrsn fetchRequiredFromArray: list.
    mcLoader postLoad: self