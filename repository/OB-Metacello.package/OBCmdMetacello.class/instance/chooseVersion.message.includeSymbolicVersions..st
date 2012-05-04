private
chooseVersion: selectBlock message: message includeSymbolicVersions: includeSymbolicVersions
	| project symbolicVersions versions loadedVersion labels |
	project := self selectedProjectInstance.
	symbolicVersions := OrderedCollection new.
	includeSymbolicVersions
		ifTrue: [ 
			symbolicVersions := (project symbolicVersionSymbols select: [ :each | project hasVersion: each ])
				collect: [ :each | 
					{(each printString , ' -> ' , (project symbolicVersionMap at: each)).
					(project version: each)} ] ].
	versions := (self versions select: selectBlock) reverse asOrderedCollection.
	loadedVersion := self currentVersion.
	labels := (symbolicVersions collect: [ :ar | ar at: 1 ]) asOrderedCollection.
	labels := labels
		,
			(versions
				collect: [ :vrsn | 
					| blessing vrsnString |
					blessing := vrsn blessing == #release
						ifTrue: [ '' ]
						ifFalse: [ ' <' , vrsn blessing asString , '> ' ].
					vrsnString := vrsn versionString , blessing.
					vrsn = loadedVersion
						ifTrue: [ '* ' , vrsnString ]
						ifFalse: [ vrsnString ] ]).
	labels addLast: 'All versions'.
	versions := (symbolicVersions collect: [ :ar | ar at: 2 ]) asOrderedCollection , versions.
	versions addLast: #all.
	^ OBChoiceRequest
		prompt: message
		labels: labels
		values: versions
		lines:
			{(symbolicVersions size).
			(versions size - 1)}