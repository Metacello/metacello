private
packagesNeedSaving: version

	| map |
	map := IdentityDictionary new.
	(version record: 'ALL') loadDirective versionDirectivesDo: [:loaderDirective | | coll |
		coll := OrderedCollection new.
		loaderDirective packagesDo: [:packageDirective |
			(self packageNeedsSaving: packageDirective spec)
				ifTrue: [ coll add: packageDirective ]].
		coll notEmpty 
			ifTrue: [ "dirty packages in configuration"
				map at: loaderDirective put: coll ]].
	^map