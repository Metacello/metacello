accessing
current
	"Each user needs to have its own instance of the receiver stored in UserGlobals."

	| userGlobals |
	userGlobals := System myUserProfile symbolList objectNamed: #UserGlobals.
	^ userGlobals at: #'MetacelloGemStoneBasePlatform_CURRENT_Instance'
		ifAbsent: [ userGlobals at: #'MetacelloGemStoneBasePlatform_CURRENT_Instance' put: self new ]
