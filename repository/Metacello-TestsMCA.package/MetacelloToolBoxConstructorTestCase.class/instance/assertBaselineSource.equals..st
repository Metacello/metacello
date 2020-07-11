private
assertBaselineSource: original equals: modified
  " In squeak, we do not log to the changes, meaning our original version will be the decompile string.
    To still compare the two, we this replace the t1 in the decompile with the actual name and pretty-print both strings "
   self
	assert: (Compiler format: (original copyReplaceTokens: 't1' with: 'spec' ) in: BaselineOf notifying: nil)
	equals: (Compiler format: modified in: BaselineOf notifying: nil)