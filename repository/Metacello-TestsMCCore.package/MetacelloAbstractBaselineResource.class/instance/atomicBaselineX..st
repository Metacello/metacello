AtomicX
atomicBaselineX: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec description: 'MetacelloAbstractBaselineResource>>atomicBaselineX:'.
      spec
        package: 'Atomic-CoreX-One'
          with: [ spec postLoadDoIt: #'atomicShareMethodSend' ];
        package: 'Atomic-CoreX-Two' with: [ spec requires: 'Atomic-CoreX-One' ];
        yourself.
      spec
        group: 'Core' with: #('Atomic-CoreX-Two');
        group: 'default' with: #('Core');
        yourself ]