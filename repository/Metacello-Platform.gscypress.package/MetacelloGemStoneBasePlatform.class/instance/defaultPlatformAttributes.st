attributes
defaultPlatformAttributes
  "gemstone   - loading into glass1 code base (extent0.seaside.dbf)
   gemstone64 - loading into base gemstone system (extent0.dbf)
   gemstoneBase - temporary designation for gemstone base"

  | stoneVersionAtts |
  (stoneVersionAtts := self stoneVersionAttributes)
    ifNil: [ ^ #(#'gemstoneCommon' #'gemstoneBase' #'gemstone64') ].
  ^ stoneVersionAtts