*metacello-monticello-platform
metacelloLoadPackages: packageList from: repositoryList
  | aGofer |
  aGofer := Gofer new.
  packageList do: [ :packageName | aGofer package: packageName ].
  repositoryList do: [ :repo | aGofer repository: repo ].
  aGofer load