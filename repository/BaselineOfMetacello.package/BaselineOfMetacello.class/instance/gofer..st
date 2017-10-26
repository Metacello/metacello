baseline
gofer: spec
      spec
        project: 'Gofer'
          with: [ 
              spec
                className: 'ConfigurationOfGofer';
                versionString: #'stable';
                loads: #('Core');
                repository: 'http://seaside.gemtalksystems.com/ss/metacello' ];
        project: 'Gofer Tests'
          copyFrom: 'Gofer'
          with: [ spec loads: #('Tests') ];
        yourself.
