repository creation
repositoryFromUrl: anUrl
  | scheme x |
  scheme := anUrl scheme.
  ((x := CypressFileUrl urlClassForScheme: scheme) inheritsFrom: CypressAbstractFileUrl)
    ifTrue: [ ^ CypressAbstractRepository onUrl: anUrl alias: '' ].
  ^ super repositoryFromUrl: anUrl
