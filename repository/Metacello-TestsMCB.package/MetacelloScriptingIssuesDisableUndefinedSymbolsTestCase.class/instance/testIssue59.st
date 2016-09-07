tests
testIssue59
	"https://github.com/dalehenrich/metacello-work/issues/59"

	"load with no errors"

	"same as testIssue47, except that ConfigurationOfIssue59 uses MetacelloVersionNumber instead of MetacelloSemanticVersionNumber, so 1.0 is a valid version number"

	Metacello new
		configuration: 'Issue59';
		version: '1.0';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		silently;
		load.
	self
		assert:
			(MetacelloPlatform current
				globalNamed: #Metacello_Configuration_Test_POST_DoIt_Result).
	self
		assert:
			(MetacelloPlatform current
				globalNamed: #Metacello_Configuration_Test_DoIt_Result).
	self
		validate: 'ConfigurationOfIssue59'
		expConfigVersion: '1.0'
		expConfigRepo: 'dictionary://Metacello_Configuration_Test_Repository'
		expBaselineClassName: 'BaselineOfIssue32'
		expBaselineVersion: 'baseline'
		expBaselineRepo: 'dictionary://Metacello_External_Test_Repository'