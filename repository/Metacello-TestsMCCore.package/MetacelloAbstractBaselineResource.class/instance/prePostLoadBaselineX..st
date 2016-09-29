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
        package: 'Atomic-CoreX-1'
          with: [ 
              spec
                preLoadDoIt: #'preLoadDoItPackage';
                postLoadDoIt: #'postLoadDoItPackage:' ];
        package: 'Atomic-CoreX-2'
          with: [ 
              spec
                preLoadDoIt: #'preLoadDoItPackage:packageSpec:';
                postLoadDoIt: #'postLoadDoItPackage';
                requires: 'Atomic-CoreX-1' ];
        yourself.
      spec
        group: 'Core' with: #('Atomic-CoreX-2');
        group: 'default' with: #('Core');
        yourself ]