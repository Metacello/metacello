defaults
releaseLocations
    ^ self deployLocations
        , #('http://www.squeaksource.com/MetacelloRepository' 'http://seaside.gemstone.com/ss/MetacelloRepository')