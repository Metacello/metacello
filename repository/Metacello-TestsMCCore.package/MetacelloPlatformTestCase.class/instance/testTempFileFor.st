tests
testTempFileFor
	"This should be enough to ensure that https://github.com/metacello/metacello/issues/405 
	 doesn't happen again"
	| tempFilePath |

	tempFilePath := MetacelloPlatform current 
		tempFileFor: 'xxx' 
		suffix: '.test'.
