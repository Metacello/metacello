test alpha/numeric version numbers
testAlphaNumericVersion1

	"Use numeric comparison for pure numbers. If you non-numeric version separate with '-'"
	
	self assert: ((self versionClass fromString: '2.9.0') < (self versionClass fromString: '2.10.0')).
