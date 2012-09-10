tests
testBaseline100
    | project version expected actual |
    project := self project.
    version := project version: '1.0-baseline'.
    expected := 'spec blessing: #''baseline''.
spec project: ''Example Project'' with: [
		spec
			className: ''ConfigurationOfExampleProject'';
			versionString: ''1.0-baseline'';
			preLoadDoIt: #''preloadForProject'';
			postLoadDoIt: #''postloadForProject'';
			loads: #(''core'' ) ].'.
    actual := version spec printString.
    self assert: expected = actual