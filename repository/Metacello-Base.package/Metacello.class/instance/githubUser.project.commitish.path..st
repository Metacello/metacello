api repository shortcuts
githubUser: userName project: projectName commitish: commitish path: path
	"commitish can be a branch name, commit hash, or tag."

	self repository: (
		'github://' , userName , '/' , projectName , (
			(commitish isNil or: [commitish isEmpty])
				ifTrue: ['']
				ifFalse: [':' , commitish]
		) , '/' , path)