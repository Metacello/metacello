transactions
transact: aBlock
	"On GemStone, we want to optionally abort before command execution and commit after 
	 common execution. Other plaforms don't need to do anything special.
	 Returning out of block, skips commit."
	
	MCPlatformSupport autoAbort ifTrue: [ System abortTransaction ].
	aBlock value.
	MCPlatformSupport autoCommit
		ifTrue: [
			System commitTransaction
				ifFalse: [
					Transcript cr; show: 'Auto commit failed.'.
					Smalltalk at: #OBInformRequest ifPresent: [:cls | 
						cls message: 'Auto commit failed. You will need to abort and try again.' ]]].