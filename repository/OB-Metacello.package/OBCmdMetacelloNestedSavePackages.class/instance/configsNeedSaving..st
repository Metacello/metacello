private
configsNeedSaving: version

	| map |
	map := IdentityDictionary new.
	(version record: 'ALL') loadDirective versionDirectivesDo: [:loaderDirective | | coll |
		loaderDirective spec notNil
			ifTrue: [ 
				(self packageNeedsSaving: loaderDirective spec project projectPackage)
					ifTrue: [ map at: loaderDirective put: #() ]]].
	^map