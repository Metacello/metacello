test projects only
testCompareCurrentVersion

	| version cv fum projectFie projectFee projectFoe foo feaux map |
	gofer
		package: 'MetacelloTestConfigurationOfFum'; 
		package: 'MetacelloTestConfigurationOfFoo'; 
		package: 'MetacelloTestConfigurationOfFeaux'; 
		package: 'MetacelloTestConfigurationOfProjectFie'; 
		package: 'MetacelloTestConfigurationOfProjectFee'; 
		package: 'MetacelloTestConfigurationOfProjectFoe'; 
		load.
	fum := (Smalltalk at: #MetacelloTestConfigurationOfFum) new project.
	foo := (Smalltalk at: #MetacelloTestConfigurationOfFoo) new project.
	feaux := (Smalltalk at: #MetacelloTestConfigurationOfFeaux) new project.
	projectFie := (Smalltalk at: #MetacelloTestConfigurationOfProjectFie) new project.
	projectFee := (Smalltalk at: #MetacelloTestConfigurationOfProjectFee) new project.
	projectFoe := (Smalltalk at: #MetacelloTestConfigurationOfProjectFoe) new project.

	gofer 
		version: 'GeauxBeau-dkh.56';
		load.
	version := feaux version: '4.0'.
	version load: 'GeauxFoo'.
	version := projectFoe version: '4.0'.
	version load: #('ALL').
	
	self assertProject: foo expectedVersionString: '4.0' expectedFidelity: #loadedToSpec.
	self assertProject: feaux expectedVersionString: '4.0' expectedFidelity: #loadedToSpec.
	self assertProject: projectFie expectedVersionString: '4.0' expectedFidelity: #loadedToSpec.
	self assertProject: projectFee expectedVersionString: '4.0' expectedFidelity: #loadedMatchConstraints.
	self assertProject: projectFoe expectedVersionString: '4.0' expectedFidelity: #allLoadedToSpec.
	self assertProject: fum expectedVersionString: '4.0' expectedFidelity: #loadedMatchConstraints.

	foo currentVersion packages do: [:pkg |
		pkg isPackageLoaded
			ifTrue: [ 
				self assert: 
					(pkg 
						compareRelativeCurrentVersion: #= 
						targetVersionStatus: nil 
						using: pkg loader).
				self assert: (pkg 
						compareCurrentVersion: #= 
						targetVersionStatus: nil
						using: pkg loader) ]].

	feaux currentVersion packages do: [:pkg |
		pkg isPackageLoaded
			ifTrue: [ 
				self assert: 
					(pkg 
						compareRelativeCurrentVersion: #= 
						targetVersionStatus: nil 
						using: pkg loader).
				self assert: (pkg 
						compareCurrentVersion: #= 
						targetVersionStatus: nil
						using: pkg loader) ]].

	projectFie currentVersion projects do: [:prj |
		self assert: 
			(prj 
				compareRelativeCurrentVersion: #= 
				targetVersionStatus: #(loadedToSpec) 
				using: prj loader).
		self assert: (prj 
				compareCurrentVersion: #= 
				targetVersionStatus: #(loadedToSpec) 
				using: prj loader) ].

	projectFee currentVersion packages do: [:pkg |
		pkg isPackageLoaded
			ifTrue: [ 
				self assert: 
					(pkg 
						compareRelativeCurrentVersion: #> 
						targetVersionStatus: nil 
						using: pkg loader).
				self assert: (pkg 
						compareCurrentVersion: #> 
						targetVersionStatus: nil
						using: pkg loader) ]].
	projectFee currentVersion projects do: [:prj |
		self assert: 
			(prj 
				compareRelativeCurrentVersion: #= 
				targetVersionStatus: #(loadedToSpec) 
				using: prj loader).
		self assert: (prj 
				compareCurrentVersion: #= 
				targetVersionStatus: #(loadedToSpec) 
				using: prj loader) ].

	projectFoe currentVersion projects do: [:prj |
		self assert: 
			(prj 
				compareRelativeCurrentVersion: #= 
				targetVersionStatus: #(allLoadedToSpec) 
				using: prj loader).
		self deny: (prj 
				compareCurrentVersion: #= 
				targetVersionStatus: #(allLoadedToSpec) 
				using: prj loader) ].

	map := Dictionary new.
	map at: 'Feaux' put: #(loadedToSpec).
	map at: 'Foo' put: #(loadedToSpec).
	map at: 'ProjectFie' put: #(loadedToSpec).
	map at: 'ProjectFee' put: #(loadedMatchConstraints).
	fum currentVersion projects do: [:prj |
		self assert: 
			(prj 
				compareRelativeCurrentVersion: #>= 
				targetVersionStatus: (map at: prj name) 
				using: prj loader).
		self assert: (prj 
				compareCurrentVersion: #>= 
				targetVersionStatus: (map at: prj name) 
				using: prj loader) ].

