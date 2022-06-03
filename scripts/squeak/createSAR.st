"Generate a SAR file of all relevant packages to install Metacello
NOTE: Make sure to run this script in an image that only contains the minimum of required packages. Further packages from any dependencies (such as STON) will be added to the SAR file independently of the requirements specified in the baseline."

| spec packageNames firstPackageNames zip preamble |
spec := #('default' 'Metacello-Help').

packageNames := ((BaselineOfMetacello project version: 'baseline')
	allPackagesForSpecNamed: spec)
		collect: #name.
packageNames := packageNames copyWithoutAll: MCRepository trunk allPackageNames.
firstPackageNames := #('Metacello-Base' 'Metacello-Core' 'MonticelloFileTree-Core'). "To overcome cyclic dependencies, define starter packages manually"
packageNames := firstPackageNames , ((packageNames copyWithoutAll: firstPackageNames)
	topologicallySortedUsing: [:a :b | ((DependencyBrowser new selectPackage: a; packageDeps) includes: b) not]). "O(n**2) bust fast enough for now"

zip := ZipArchive new.
preamble := String streamContents: [:preambleStream |
	preambleStream
		nextPutAll: '| loader |
((Smalltalk globals includesKey: #MetacelloStub) and: [(Smalltalk at: #Metacello ifAbsent: [nil]) = (Smalltalk at: #MetacelloStub)]) ifTrue: [
Smalltalk globals removeKey: #Metacello].
loader := MCVersionLoader new.';
		cr.
	packageNames do: [:name | | stream version |
		stream := RWBinaryOrTextStream on: (String new: 10000).
		version := MCVersion
			package: (MCPackage named: name)
			info: (MCPackage named: name) workingCopy ancestry ancestors first.
		version fileOutOn: stream.
		(zip addString: stream contents as: name, '.mcz') desiredCompressionLevel: 0.
		preambleStream
			nextPutAll: 'loader addVersion: (MCMczReader versionFromStream: (self memberNamed: ''';
			nextPutAll: name;
			nextPutAll: '.mcz'') contentStream).';
			cr].
	preambleStream nextPutAll: 'loader load.'].
zip addString: preamble as: 'install/preamble'.
zip writeToFileNamed: 'metacello.sar'.
