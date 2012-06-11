private
ensureMetacello
    "Bootstrap Metacello and load the 'botstrap' group"

    "Use scripting api so that Metacello and dependent projects registered correctly"

    self ensureMetacello: #('bootstrap').
    Metacello new
        configuration: 'Metacello';
        repository: 'http://seaside.gemstone.com/ss/metacello';
        repository: 'http://www.squeaksource.com/metacello';
        load: 'batch'