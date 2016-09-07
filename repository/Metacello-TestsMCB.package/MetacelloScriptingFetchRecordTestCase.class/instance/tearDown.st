running
tearDown
	"these removals must be performed BEFORE super tearDown"

	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving:
			(Smalltalk at: #Metacello_Configuration_Test_Repository ifAbsent: [  ]);
		cleanUpRepositoryGroupRemoving: (Smalltalk at: #Metacello_Gofer_Test_Repository ifAbsent: [  ]);
		cleanUpRepositoryGroupRemoving: (Smalltalk at: #Metacello_Cache_Test_Repository ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Gofer_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Cache_Test_Repository
		ifAbsent: [  ].
	super tearDown.
	(Metacello registry
		project: [ :spec | spec className beginsWith: 'MetacelloTest' ];
		list) do: [ :spec | spec unregisterProject ]