loading
loadPreloadDirective: aPreloadDirective
  | block |
  (block := aPreloadDirective spec preLoadDoItBlock) ~~ nil
    ifTrue: [ 
      aPreloadDirective
        evaluateSupplyingAnswers: [ block cull: aPreloadDirective loader cull: aPreloadDirective spec ].
      Transcript
        cr;
        show:
            'Evaluated -> ' , aPreloadDirective spec label , ' >> '
                , aPreloadDirective spec preLoadDoIt value asString ]