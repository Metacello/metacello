help
helpIntro
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: 'Metacello is a package management system for Monticello';
		cr;cr;nextPutAll: 'Metacello Browser is written and maintained by:';
		cr;tab;nextPutAll: 'Dale Henrichs';
		cr;cr;nextPutAll: 'To submit bug reports, visit the following link:';
		cr;tab;nextPutAll: 'http://code.google.com/p/metacello/issues/entry';
		cr;cr;nextPutAll: 'For additional info see the Metacello project site:';
		cr;tab;nextPutAll: 'http://code.google.com/p/metacello/'.
	^ (Smalltalk at: #HelpTopic) perform: #title:contents: with: 'Introduction' with: stream contents