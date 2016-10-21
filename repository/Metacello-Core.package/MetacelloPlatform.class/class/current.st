accessing
current
	PlatformClassAssociation ifNotNil: [:platformClassAssoc | 
	"When Metacello is installed as SystemUser in GemStone, each user must have an instance of the platform class stored in UserGlobals."
	^ platformClassAssoc value current ].
	Current ifNil: [
		"Expect Current to be set by #select --- MetacelloPlatform is not functional by itself"
		Current := MetacelloPlatform new].
	^ Current
