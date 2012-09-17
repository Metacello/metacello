tests
testImportFrom2
    self create12Version.
    self
        assert:
            ((Smalltalk at: self configurationName) sourceCodeAt: #'version12:') asString = self version12SourceString