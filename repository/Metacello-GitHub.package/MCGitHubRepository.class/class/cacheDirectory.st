private
cacheDirectory
	| cacheDirectory |
	cacheDirectory :=  FileLocator imageDirectory asFileReference / 'github-cache'.
     	^ cacheDirectory ensureDirectory; yourself