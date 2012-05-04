private
createTopicFrom: aDescription
	| topic |
	topic := HelpTopic named: aDescription bookName.
	topic key: aDescription key.
	topic icon: aDescription icon.
	aDescription pages do: [ :pageSelector | topic addSubtopic: (aDescription perform: pageSelector) ].
	(MetacelloToolBox configurationClasses asArray
		sort: [ :a :b | (MetacelloToolBox baseNameOfConfiguration: a) <= (MetacelloToolBox baseNameOfConfiguration: b) ])
		do: [ :class | topic addSubtopic: (MetacelloToolBox  helpTopicFor: class) ].
	^ topic