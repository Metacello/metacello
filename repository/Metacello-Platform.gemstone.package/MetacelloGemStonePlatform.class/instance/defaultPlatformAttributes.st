attributes
defaultPlatformAttributes
  | stoneVersionAtts |
  (stoneVersionAtts := self stoneVersionAttributes)
    ifNil: [ ^ #(#'gemstone' #'gemstoneCommon') ].
  ^ stoneVersionAtts , self devKitPlatformAttributes