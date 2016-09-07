tests
testIssue47
	"https://github.com/dalehenrich/metacello-work/issues/47"

	"load with no errors"

	Metacello new
		configuration: 'Issue32';
		version: '1.0.0';
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
		validate: 'ConfigurationOfIssue32'
		expConfigVersion: '1.0.0'
		expConfigRepo: 'dictionary://Metacello_Configuration_Test_Repository'
		expBaselineClassName: nil
		expBaselineVersion: nil
		expBaselineRepo: nil