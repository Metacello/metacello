accessing
filter
    filter ifNil: [ filter := MetacelloVersionSpecFilter new constructor: self ].
    ^ filter