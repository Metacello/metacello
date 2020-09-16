attributes
defaultPlatformAttributes
	| attributes systemVersion major minor both |
	attributes := OrderedCollection with: #squeakCommon with: #squeak.
	systemVersion := (Smalltalk at: #SystemVersion ifPresent: [:cl | cl current])
		ifNil: [^ attributes "get out early if we don't know about this verison"].
	both := systemVersion majorMinorVersion readStream.
	[both peek isDigit] whileFalse: [both next].

	major := both upTo: $..
	minor := both upToEnd.
	(systemVersion version endsWith: 'alpha')
		ifTrue: ["For alphas it is sensible to pretend to be the previous version, 
				so that things can be tested and then moved forward."
				minor ~= '0'
					ifTrue: 
						["easy" attributes add: ('squeak', major, '.', (minor asInteger - 1) asString, '.x') asSymbol]
					ifFalse:
						[" well we would have to guess the previous release for 'big jumps' here,
						  so for now use a list of known jumps or roll down to 10 "
						| priorVersion priorMajor |
						priorMajor := major asInteger - 1.
						priorVersion := #(('1' '1.31') ('2' '2.8') ('3' '3.10') ('4' '4.5' "on purpose NOT 4.6") ('5' '5.3'))
							at: priorMajor ifAbsent: [{priorMajor asString . priorMajor asString, '.10'}].
						attributes
							add: ('squeak', priorVersion first, '.x') asSymbol;
							add: ('squeak', priorVersion second, '.x') asSymbol]].
	attributes
		add: ('squeak', major, '.x') asSymbol;
		add: ('squeak', major, '.', minor, '.x') asSymbol.
	^ attributes