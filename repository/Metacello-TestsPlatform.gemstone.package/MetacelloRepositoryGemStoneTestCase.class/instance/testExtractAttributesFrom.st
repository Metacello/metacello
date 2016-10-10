tests
testExtractAttributesFrom
  | platform input output result |
  platform := MetacelloGemStonePlatform new.
  input := {'2.4.5'.
  '2.5'.
  '2.4.4.1'.
  '2'.
  '2.'.
  ''}.
  output := {#(#'gemstoneCommon' #'gemstone' #'gsc2.x' #'gs2.x' #'gsc2.4.x' #'gs2.4.x' #'gsc2.4.5.x' #'gs2.4.5.x').
  #(#'gemstoneCommon' #'gemstone' #'gsc2.x' #'gs2.x' #'gsc2.5.x' #'gs2.5.x').
  #(#'gemstoneCommon' #'gemstone' #'gsc2.x' #'gs2.x' #'gsc2.4.x' #'gs2.4.x' #'gsc2.4.4.x' #'gs2.4.4.x' #'gsc2.4.4.1.x' #'gs2.4.4.1.x').
  #(#'gemstoneCommon' #'gemstone' #'gsc2.x' #'gs2.x').
  #(#'gemstoneCommon' #'gemstone' #'gsc2.x' #'gs2.x').
  #(#'gemstoneCommon' #'gemstone')}.
  1 to: input size do: [ :index | result := platform extractAtrributesFrom: (input at: index).
    self assert: result = (output at: index) ]
