attributes
defaultPlatformAttributes
  | stoneVersionAtts |
  (stoneVersionAtts := self stoneVersionAttributes)
    ifNil: [ ^ #(#'gemstoneCommon' #'gemstoneBase') ].
  ^ stoneVersionAtts , self devKitPlatformAttributes