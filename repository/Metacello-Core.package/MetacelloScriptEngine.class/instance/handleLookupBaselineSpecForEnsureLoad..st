handlers
handleLookupBaselineSpecForEnsureLoad: exception
	"if existing and new don't compare equal, then ensure the new baseline is loaded"

	| existing new |
	new := exception projectSpec.
	existing := self lookupBaselineSpecForEnsure: exception projectSpec.
	^ exception resume: (existing registrationsCompareEqual: new) not