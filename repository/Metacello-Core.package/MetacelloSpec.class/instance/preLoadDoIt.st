doits
preLoadDoIt
  "noop unless non-nil value returned"

  ^ self project valueHolderSpec
    value: self;
    yourself