accessing
projectVersionEscaped
  | pv |
  pv := self projectVersion.
  (projectVersion includes: $/)
    ifFalse: [ ^ pv ].
  ^ pv copyReplaceAll: '/' with: '\/'