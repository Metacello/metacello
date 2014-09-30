descriptions
description
  | desc |
  desc := self class description , self projectPath , ':'
    , self projectVersionEscaped.
  self repoPath ifNil: [ ^ desc ].
  ^ desc , '/' , self repoPath