accessing
baselineProjectSpec: anObject
	"only one of baselineProjectSpec or configurationProjectSpec should ever be set"

	self shouldBeMutable.
	self
		assert: configurationProjectSpec isNil;
		assert: anObject isBaselineOfProjectSpec.
	baselineProjectSpec := anObject