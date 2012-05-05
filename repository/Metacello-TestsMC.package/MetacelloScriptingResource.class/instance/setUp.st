running
setUp
	"self reset"

	super setUp.
	self
		setUpRepositories;
		setUpExternalCore;
		setUpSampleCore;
		setUpBaselineOfExternal;
		yourself