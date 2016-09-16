*Metacello-GsCypress-Platform
createRepository: aRepositorySpec

  ^ CypressAbstractRepository
      onUrl: aRepositorySpec description asUrl
      alias: 'MetacelloPlatform repo'.
