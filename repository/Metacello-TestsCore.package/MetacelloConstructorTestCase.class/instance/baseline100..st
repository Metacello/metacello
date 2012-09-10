baselines
baseline100: spec
    <version: '1.0-baseline'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
            spec
                project: 'Example Project'
                    with: [ 
                            spec
                                className: 'ConfigurationOfExampleProject';
                                versionString: '1.0-baseline';
                                preLoadDoIt: #'preloadForProject';
                                postLoadDoIt: #'postloadForProject';
                                loads: #('core');
                                yourself ];
                yourself ]