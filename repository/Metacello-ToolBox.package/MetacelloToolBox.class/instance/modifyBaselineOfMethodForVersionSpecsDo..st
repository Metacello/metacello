api-configuration
modifyBaselineOfMethodForVersionSpecsDo: aBlock
  ^ self
    updateBaselineOfMethodForProjects: false
    updatePackages: false
    versionSpecsDo: aBlock