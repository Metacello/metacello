accessing
projectSpecs
    projectSpecs ifNil: [ projectSpecs := OrderedCollection new ].
    ^ projectSpecs