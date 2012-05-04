extraction
extractMethodSectionsFor: sourceVersionString specBlock: specBlock
    | versionSpec version versionMap |
    self setProject: MetacelloMCProject new.
    versionSpec := self project versionSpec.
    versionSpec versionString: sourceVersionString.
    specBlock value: self.	"equivalent to #evaluatePragma:"
    self methodSections do: [ :methodSection | self evaluateMethodSection: methodSection version: sourceVersionString ]