AtomicX
atomicBaselineX: spec
  <baseline>
  spec
    for: #'common'
    do: [ spec description: 'MetacelloAbstractBaselineResource>>atomicBaselineX:'.
      spec
        package: 'Atomic-CoreX-One'
          with: [ spec postLoadDoIt: #'atomicShareMethodSend' ];
        package: 'Atomic-CoreX-Two' with: [ spec
                includes: 'Atomic-CoreX-Three';
                requires: 'Atomic-CoreX-One' ];
        package: 'Atomic-CoreX-Three'
          with: [ spec requires: 'Atomic-CoreX-Two' ];
        yourself.
      spec
        group: 'Core' with: #('Atomic-CoreX-Two');
        group: 'default' with: #('Core');
        yourself ]