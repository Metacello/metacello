AtomicX
atomicShareMethodSend
  "AtomicCoreX1 class>>atomicSharedMethod method needs to always be present after AtomicCoreX1 loaded --- canary in the mine for atomicLoad --- triggered by postLoad action."

  (MetacelloPlatform current globalNamed: 'AtomicCoreX1') atomicSharedMethod