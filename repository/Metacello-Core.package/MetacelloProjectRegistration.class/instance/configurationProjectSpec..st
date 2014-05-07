accessing
configurationProjectSpec: anObject
	"only one of baselineProjectSpec or configurationProjectSpec should ever be set"

	self shouldBeMutable.
	self
		assert: baselineProjectSpec isNil;
		assert: anObject isConfigurationOfProjectSpec.
	configurationProjectSpec := anObject