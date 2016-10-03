repository creation
repositoryFromUrl: anUrl
  | scheme x |
  scheme := anUrl scheme.
  ((x := FileUrl urlClassForScheme: scheme) inheritsFrom: CypressAbstractFileUrl)
    ifTrue: [ ^ CypressAbstractRepository onUrl: anUrl alias: '' ].
  ^ super repositoryFromUrl: anUrl