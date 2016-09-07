accessing
setUpRepositoryContents
	| dict |
	super setUpRepositoryContents.
	MetacelloPlatform current
		globalNamed: #Metacello_MczConfiguration_Test_Repository
		put:
			(MCDictionaryRepository new
				dictionary: mczConfigurationRepository dictionary copy).
	dict := (MetacelloPlatform current
		globalNamed: #Metacello_MczConfiguration_Test_Repository) dictionary.
	monticelloRepository dictionary
		keysAndValuesDo:
			[ :info :version | "Horrible hack...shoudl use #storeVersion: ...  but this hack is too simple" dict at: info put: version ]