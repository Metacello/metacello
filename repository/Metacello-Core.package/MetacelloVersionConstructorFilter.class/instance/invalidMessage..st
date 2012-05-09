error handling
invalidMessage: selector
    ^ self error: 'The ' , selector printString , ' message is not valid for defining a ' , self label , ' spec'