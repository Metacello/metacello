accessing
repositoryDescription
    repositoryDescription ifNil: [ repositoryDescription := 'http://www.squeaksource.com/MetacelloRepository' ].
    ^ repositoryDescription