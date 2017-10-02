loading
loadPostloadDirective: aPostloadDirective
  | block |
  (block := aPostloadDirective spec postLoadDoItBlock) ~~ nil
    ifTrue: [ 
      aPostloadDirective
        evaluateSupplyingAnswers: [ block cull: aPostloadDirective loader cull: aPostloadDirective spec ].
      Transcript
        cr;
        show:
            'Evaluated -> ' , aPostloadDirective spec label , ' >> '
                , aPostloadDirective spec postLoadDoIt value asString ]
