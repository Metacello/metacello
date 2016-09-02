actions
linearLoadPackageSpecs: packageSpecs repositories: repositories
  | gofer |
  gofer := MetacelloPlatform current metacelloGoferClass new.
  repositories do: [ :repo | gofer repository: repo ].
  packageSpecs do: [ :pkg | pkg loadUsing: self gofer: gofer ]