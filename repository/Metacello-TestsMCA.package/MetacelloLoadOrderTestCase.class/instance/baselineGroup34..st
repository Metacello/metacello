baselines
baselineGroup34: spec
  <version: '3.4-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Example-Core' with: [ spec includes: #('GemStone Core') ];
        package: 'Example-2' with: [ spec requires: #('Example-Core') ];
        package: 'Example-3' with: [ spec requires: #('Example-Core') ];
        package: 'Example-Core';
        package: 'Example-1' with: [ spec requires: #('Example-Core') ];
        package: 'Example-GemStone300-Core'
          with: [ 
              spec
                requires: #('Example-Core');
                includes: #('GemStone Core') ];
        package: 'Example-GemStone-Core'
          with: [ spec requires: #('Example-Core') ];
        package: 'Example-Core' with: [ spec includes: #('GemStone 300 Core') ];
        yourself.
      spec
        group: 'GemStone Core' with: #('Example-GemStone-Core');
        group: 'GemStone 300 Core' with: #('Example-GemStone300-Core');
        yourself ]