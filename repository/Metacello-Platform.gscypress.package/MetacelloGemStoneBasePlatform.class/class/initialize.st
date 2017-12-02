initialize-release
initialize
  "self initialize"

  "In GemStone need to keep the assocation for the receiver, in case it changes shape.
   The user-specific instance of the platformClass will be stored in UserGlobals. " 

   | ar |
   Smalltalk 
     at: self name
     ifPresent: [:cls | 
       ar := (System myUserProfile symbolList dictionariesAndSymbolsOf: cls ) at: 1. "expect to find at least one or error"
       PlatformClassAssociation := (ar at: 1) associationAt: (ar at: 2) ]
