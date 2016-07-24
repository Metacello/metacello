running
setUp
  "run superclass tests using Cypress packages"

  super setUp.
  useCypressPackagesForAllBaselines := MetacelloCypressBaselineProject
    useCypressPackagesForAllBaselines.
  MetacelloCypressBaselineProject useCypressPackagesForAllBaselines: true