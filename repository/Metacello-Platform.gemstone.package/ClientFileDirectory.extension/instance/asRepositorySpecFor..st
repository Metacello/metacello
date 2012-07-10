*metacello-platform
asRepositorySpecFor: aMetacelloMCProject

	^(aMetacelloMCProject repositorySpec)
		description:  'client://', self fullName;
	 	type: 'clientDirectory';
		yourself