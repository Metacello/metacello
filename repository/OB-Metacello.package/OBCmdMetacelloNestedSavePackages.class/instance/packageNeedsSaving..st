private
packageNeedsSaving: packageSpec

	| wc |
	^((wc := packageSpec workingCopy) ~~ nil) 
		and: [wc ancestry ancestors isEmpty 
				or: [ wc modified ]]