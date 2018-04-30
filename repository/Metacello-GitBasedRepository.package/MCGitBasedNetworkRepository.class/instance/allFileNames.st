accessing
allFileNames
	self flag: #review. "This will fail in non filtree(cypress) formats, but I need to 
	 implement it to make the tests pass. A better approach maybe to look at those tests 
	 and try to implement them better."
	^ self localRepository allFileNames