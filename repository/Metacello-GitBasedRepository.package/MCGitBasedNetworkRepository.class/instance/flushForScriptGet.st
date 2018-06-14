initialize-release
flushForScriptGet

	self class 
		flushProjectEntry: self projectPath 
		version: self projectVersion.
    self localRepository flushForScriptGet