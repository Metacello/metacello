attributes
defaultPlatformAttributes
  | stoneVersionAtts |
  (stoneVersionAtts := self stoneVersionAttributes)
    ifNil: [ ^ #(#'gemstoneCommon' #'gemstone') ].
  ^ stoneVersionAtts , self devKitPlatformAttributes