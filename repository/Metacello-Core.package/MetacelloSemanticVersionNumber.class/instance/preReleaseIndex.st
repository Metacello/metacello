accessing
preReleaseIndex
    preReleaseIndex = 0
        ifTrue: [ preReleaseIndex := self size + 1 ].
    ^ preReleaseIndex