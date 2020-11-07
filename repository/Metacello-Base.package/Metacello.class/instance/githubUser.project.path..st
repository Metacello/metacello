api repository shortcuts
githubUser: userName project: projectName path: path

	^ self
		githubUser: userName
		project: projectName
		commitish: nil
		path: path