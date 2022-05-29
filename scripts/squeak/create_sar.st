| preamble zip |
zip := ZipArchive new.
preamble := String streamContents: [:preambleStream |
	preambleStream
		nextPutAll: '| loader |
((Smalltalk globals includesKey: #MetacelloStub) and: [(Smalltalk at: #Metacello ifAbsent: [nil]) = (Smalltalk at: #MetacelloStub)]) ifTrue: [
Smalltalk globals removeKey: #Metacello].
loader := MCVersionLoader new.';
		cr.
	(((BaselineOfMetacello project version: 'baseline') allPackagesForSpecNamed: #default) collect: #name) do: [:name | | stream version |
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
