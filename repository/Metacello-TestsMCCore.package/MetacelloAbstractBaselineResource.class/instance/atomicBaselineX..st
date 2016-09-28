AtomicX
atomicBaselineX: spec
  <baseline>
  spec description: 'MetacelloAbstractBaselineResource>>externalBaselineX:'.
  spec
    package: 'Atomic-CoreX-1';
    package: 'Atomic-CoreX-2' with: [ spec requires: 'Atomic-CoreX-1' ];
    yourself.
  spec
    group: 'Core' with: #('Atomic-CoreX-2');
    group: 'default' with: #('Core');
    yourself