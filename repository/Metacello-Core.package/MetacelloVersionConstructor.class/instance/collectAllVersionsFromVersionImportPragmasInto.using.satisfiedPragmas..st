private
collectAllVersionsFromVersionImportPragmasInto: versionMap using: executionBlock satisfiedPragmas: pragmaDict

	| defined done completed |
	done := false.
	completed := IdentitySet new.
	[ done ]
		whileFalse: [ 
			done := true.
			pragmaDict
				keysAndValuesDo: [ :versionString :pragmaColl | 
					| versionSpec |
					versionSpec := nil.
					defined := false.
					pragmaColl
						do: [ :pragma | 
							(completed includes: pragma)
								ifFalse: [ 
									done := false.
									(pragma argumentAt: 2)
										do: [ :importedVersion | 
											| version |
											(version := versionMap at: importedVersion ifAbsent: [  ]) ~~ nil
												ifTrue: [ 
													defined := true.
													versionSpec == nil
														ifTrue: [ versionSpec := version spec copy ]
														ifFalse: [ versionSpec := versionSpec mergeSpec: version spec copy ].
													versionSpec versionString: versionString.
													executionBlock value: versionSpec value: pragma ] ].
									defined
										ifTrue: [ completed add: pragma ] ] ].
					defined
						ifTrue: [ 
							| version importedVersions |
							importedVersions := OrderedCollection new.
							version := versionSpec createVersion.
							pragmaColl do: [ :pragma | importedVersions addAll: (pragma argumentAt: 2) ].
							version importedVersions: importedVersions.
							self validateVersionString: versionString againstSpec: versionSpec.
							versionMap at: versionSpec versionString put: version ].
					self reset ] ]