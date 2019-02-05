private
hasStatement: selector
	^ statements anySatisfy: [ :ea | ea = selector ]