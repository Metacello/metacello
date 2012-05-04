help
helpInstallation
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: 'To install the core functionality of Metacello, execute the following expression:';
		cr; tab; nextPutAll: 'ConfigurationOfMetacello load.';
		cr;cr;nextPutAll: 'To install the tutorial (recommended), execute the following expression:';
		cr; tab; nextPutAll: '(ConfigurationOfMetacello project version: #stable) load: #(''Tutorial'').'.
	^ (Smalltalk at: #HelpTopic) perform: #title:contents: with: 'Installing' with: stream contents
