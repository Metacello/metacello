initialize-release
flushForScriptGet

	self class 
		flushProjectEntry: self projectPath 
		version: self projectVersion.
	"not needed"
    "self localRepository flushForScriptGet"