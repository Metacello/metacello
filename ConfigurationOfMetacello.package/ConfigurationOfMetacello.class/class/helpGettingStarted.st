help
helpGettingStarted
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: 'To get started, install Metacello and see the ''Getting Started'' section in the Metacello chapter of the Help Browser:';
		cr; tab; nextPutAll: 'HelpBrowser openOn: ((Smalltalk at: #MetacelloHelp) perform:  #asHelpTopic)';
		cr;cr;nextPutAll: 'It is also recommended that you install the Metacello Browser,. For information see';
		cr; tab; nextPutAll: 'http://metacellobrowser.dcc.uchile.cl/'.
	^ (Smalltalk at: #HelpTopic) perform: #title:contents: with: 'Getting Started' with: stream contents
