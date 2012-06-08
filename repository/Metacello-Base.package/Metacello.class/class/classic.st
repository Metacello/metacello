instance creation
classic
    "set the options such that the load performed will be identical to the classic ConfigurationOf load:
	(ConfigurationOfExample project version: '1.0') load
	
	#classic basically arranges for the registry mechanism to be bypassed during lookup "

    "the classicLoad option shouldn't be used without the following onUpgrade: and onConflict: statments ...statement  order is important!"

    ^ self new
        onUpgrade: [ :ex | ex allow ];
        onConflict: [ :ex | ex allow ];
        addStatement: #'classic:' args: {true};
        yourself