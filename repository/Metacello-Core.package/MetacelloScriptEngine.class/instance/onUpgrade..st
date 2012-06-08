options api
onUpgrade: aBlock
    self classic
        ifTrue: [ 
            "ignore onConflict: settings once classic is set"
            ^ self ].
    self options at: #'onUpgrade' put: aBlock