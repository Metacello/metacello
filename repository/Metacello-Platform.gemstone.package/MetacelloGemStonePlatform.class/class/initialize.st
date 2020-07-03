initialize-release
initialize
  "self initialize"

  Smalltalk
    at: #'MetacelloGemStonePlatform3x'
    ifAbsent: [ 
      self select.
      SystemLoginNotification subscribe: self name.
      self sessionStart ]