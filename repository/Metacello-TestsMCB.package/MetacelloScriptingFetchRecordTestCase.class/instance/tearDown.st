running
tearDown
  "these removals must be performed BEFORE super tearDown"

  MCRepositoryGroup default
    removeIdenticalRepository:
        (Smalltalk globals at: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ]);
    removeIdenticalRepository:
        (Smalltalk globals at: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ]);
    removeIdenticalRepository:
        (Smalltalk globals at: #'Metacello_Cache_Test_Repository' ifAbsent: [  ]).
  Smalltalk globals removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_Cache_Test_Repository' ifAbsent: [  ].
  super tearDown.
  (Metacello registry
    project: [ :spec | spec className beginsWith: 'MetacelloTest' ];
    list) do: [ :spec | spec unregisterProject ]