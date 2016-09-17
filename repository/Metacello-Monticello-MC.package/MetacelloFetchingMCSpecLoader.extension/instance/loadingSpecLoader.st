*metacello-monticello-mc
loadingSpecLoader

	^(MetacelloLoadingMCSpecLoader on: self spec)
		shouldDisablePackageCache: self shouldDisablePackageCache;
		loaderPolicy: self loaderPolicy copy;
		yourself