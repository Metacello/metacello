running
runCase
	| original |
	(self doSilently) ifFalse: [ ^super runCase ].
	original := MetacelloPlatform current bypassGoferLoadUpdateCategories.
	[ 
	MetacelloPlatform current bypassGoferLoadUpdateCategories: true.
	^ SystemChangeNotifier uniqueInstance doSilently: [ super runCase ] ]
		ensure: [ MetacelloPlatform current bypassGoferLoadUpdateCategories: original ]