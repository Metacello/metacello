private
linearLoadPackageSpec: packageSpec packageManager: packageManager
  self halt.
  self scheduleFetchFor: packageSpec
