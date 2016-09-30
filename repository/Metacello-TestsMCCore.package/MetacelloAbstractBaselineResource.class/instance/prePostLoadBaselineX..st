PrePostLoadX
prePostLoadBaselineX: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec description: 'MetacelloAbstractBaselineResource>>prePostLoadBaselineX:'.
      spec preLoadDoIt: #'preLoadDoItBaseline:'.
      spec postLoadDoIt: #'postLoadDoItBaseline:versionSpec:'.
      spec
        package: 'Atomic-CoreX-One'
          with: [ 
              spec
                preLoadDoIt: #'preLoadDoItPackage';
                postLoadDoIt: #'postLoadDoItPackage:' ];
        package: 'Atomic-CoreX-Two'
          with: [ 
              spec
                preLoadDoIt: #'preLoadDoItPackage:packageSpec:';
                postLoadDoIt: #'postLoadDoItPackage';
                requires: 'Atomic-CoreX-One' ];
        yourself.
      spec
        group: 'Core' with: #('Atomic-CoreX-Two');
        group: 'default' with: #('Core');
        yourself ]