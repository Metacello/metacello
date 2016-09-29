*Metacello-GsCypress-MC
loadLinearLoadDirective: aLoaderDirective packageManager: aPackageManager
  self finalizeLoad: aPackageManager.
  super
    loadLinearLoadDirective: aLoaderDirective
    packageManager: aPackageManager