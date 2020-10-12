private
projectZipUrlFor: projectPath versionString: versionString

	^ 'https://api.github.com/repos/' , projectPath , '/zipball/' , versionString