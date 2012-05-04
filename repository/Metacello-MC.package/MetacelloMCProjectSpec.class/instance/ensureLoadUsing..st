loading
ensureLoadUsing: aLoader
    (MetacelloLookupConfigurationPackageSpecNotification new
        packageSpec: self projectPackage;
        yourself) signal ensureLoadUsing: aLoader