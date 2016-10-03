repository creation
repositoryFromUrl: anUrl
  | scheme |
  scheme := anUrl scheme.
  ((FileUrl urlClassForScheme: scheme) isKindOf: CypressAbstractFileUrl)
    ifTrue: [ ^ CypressAbstractRepository onUrl: anUrl ].
  ^ super repositoryFromUrl: anUrl