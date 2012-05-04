accessing
goferCache
    goferCache ifNil: [ goferCache := Dictionary new ].
    ^ goferCache