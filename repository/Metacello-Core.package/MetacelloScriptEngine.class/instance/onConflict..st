options api
onConflict: aBlock
    self classic
        ifTrue: [ 
            "ignore onConflict: settings once classic is set"
            ^ self ].
    self options at: #'onConflict' put: aBlock