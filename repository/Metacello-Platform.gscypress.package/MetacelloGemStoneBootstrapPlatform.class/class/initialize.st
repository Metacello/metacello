initialize-release
initialize
  "self initialize"

  "In GemStone need to keep the assocation for the receiver, in case it changes shape.
   The user-specific instance of the platformClass will be stored in UserGlobals. " 

   PlatformClassAssociation := nil.
   self select.
