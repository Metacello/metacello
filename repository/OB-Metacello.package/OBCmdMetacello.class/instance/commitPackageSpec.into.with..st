private
commitPackageSpec: packageSpec into: repositoryList with: message
	| gofer |
	gofer := Gofer new.
	gofer disablePackageCache.
	repositoryList do: [:repository | gofer repository: repository].
	gofer package: packageSpec name.
	gofer commit: message
