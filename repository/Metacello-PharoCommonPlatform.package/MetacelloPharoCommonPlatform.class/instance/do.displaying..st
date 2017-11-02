notification
do: aBlock displaying: aString

    self bypassProgressBars ifTrue: [ ^ super do: aBlock displaying: aString ].
	
    aString
        displayProgressFrom: 0 to: 2
        during: [:bar |
            bar value: 1.
            aBlock value.
            bar value: 2 ]