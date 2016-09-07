accessing
testOnWarningLogDuringLoad
	| noWarning externalCoreClass |
	Metacello new
		configuration: 'Issue181';
		version: '0.9.1';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		load.
	noWarning := true.
	externalCoreClass := MetacelloPlatform current
		globalNamed: #ExternalCore
		ifAbsent: [ self assert: false ].
	self deny: (externalCoreClass selectors includes: #forceWarning).
	externalCoreClass compile: 'forceWarning ^self'.	"dirty the package"
	self assert: (externalCoreClass selectors includes: #forceWarning).
	[ Metacello new
		configuration: 'Issue181';
		version: '0.9.3';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		silently;
		onWarningLog;
		load ]
		on: Warning
		do: [ :ex | 
			noWarning := false.
			ex resume ].
	self assert: noWarning