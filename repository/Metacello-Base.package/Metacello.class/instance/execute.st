private
execute
    | script |
    script := self statements.
    self statements: nil.
    ^ self scriptEngine execute: script