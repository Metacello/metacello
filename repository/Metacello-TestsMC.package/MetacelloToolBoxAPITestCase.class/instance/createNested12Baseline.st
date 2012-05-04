utility
createNested12Baseline

	MetacelloConfigurationResource projectAttributes: #( nested ).
	self create10Baseline.
	(Smalltalk at: self configurationName) compile: self projectSourceString classified: 'cat'.
	(MetacelloToolBox configurationNamed: self configurationName asString)
		createVersionMethod: 'baseline12:' inCategory: 'baselines' forVersion: '1.2-baseline';
		addSectionsFrom: '1.0-baseline'
			forBaseline: true
			updateProjects: false
			updatePackages: false
			versionSpecsDo: [ :attribute :versionSpec | true ];
		commitMethod;
		modifyVersionMethodForVersion: '1.2-baseline';
		addSection: #( common nested)
			repository: nil
			requiredProjects: #()
			packages: #('GoferFoo' 'GoferBar')
			dependencies: {('GoferBar' -> #('GoferFoo'))}
			groups: {('UI' -> #('GoferBar'))}
			versionSpecsDo: [ :versionSpec |  ];
		addSection: #nested
			repository: nil
			requiredProjects: #()
			packages: #('GoofyFoo' 'GoofyBar')
			dependencies: {('GoofyBar' -> #('GoofyFoo'))}
			groups: {('UI' -> #('GoofyBar'))}
			versionSpecsDo: [ :versionSpec |  ];
		addSection: #outer
			repository: nil
			requiredProjects: #()
			packages: #('DaffyFoo' 'DaffyBar')
			dependencies: {('DaffyBar' -> #('DaffyFoo'))}
			groups: {('UI' -> #('DaffyBar'))}
			versionSpecsDo: [ :versionSpec |  ];
		addSection: #(outer nested)
			repository: nil
			requiredProjects: #()
			packages: #('GoofyFoo' 'GoofyBar')
			dependencies: {('GoofyBar' -> #('GoofyFoo'))}
			groups: {('UI' -> #('GoofyBar'))}
			versionSpecsDo: [ :versionSpec |  ];
		commitMethod.
