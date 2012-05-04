private building
buildSubnodesForMethods
	| class pragmas classSide stream |
	class := rootToBuildFrom class.
	pragmas := (Pragma allNamed: #apiDocumentation in: class) asArray sort: [ :a :b | a selector <= b selector ].
	pragmas isEmpty ifTrue: [ ^self ].
	topicToBuild icon: (HelpIcons iconNamed: #bookIcon).
	classSide := HelpTopic named: 'Class side'.
	topicToBuild addSubtopic: classSide.
	pragmas
		do: [ :pragma | 
			| topic comments methodComment |
			topic := HelpTopic named: pragma selector asString.
			classSide addSubtopic: topic.
			stream := String new writeStream.
			stream
				nextPutAll: class name;
				nextPutAll: '>>';
				nextPutAll: pragma selector asString;
				cr;
				cr.
			comments := class commentsAt: pragma selector.
			methodComment := comments size = 0
				ifTrue: [ 'Method has no comment.' ]
				ifFalse: [ comments first ].
			stream nextPutAll: methodComment.
			topic contents: stream contents ]