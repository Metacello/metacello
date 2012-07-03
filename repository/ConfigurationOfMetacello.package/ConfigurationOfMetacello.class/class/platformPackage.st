private
platformPackage

	Smalltalk at: #SystemVersion ifPresent: [ :sysVersion | | versionString |
		versionString := sysVersion current version.

		(versionString beginsWith: 'Squeak') ifTrue: [ 
			^ (versionString beginsWith: 'Squeak3')
				ifTrue: [ 'Metacello-Platform.squeak-dkh.5' ]
				ifFalse: [ 'Metacello-Platform.squeak-dkh.10' ] ].
		
		(versionString beginsWith: 'Pharo') ifTrue: [ 
			^ (versionString beginsWith: 'Pharo2')
				ifTrue: [ 'Metacello-Platform.pharo20-SeanDeNigris.28' ]
				ifFalse: [ 'Metacello-Platform.pharo-dkh.27' ] ] ].
	^ nil.