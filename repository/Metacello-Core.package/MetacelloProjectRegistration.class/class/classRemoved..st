accessing
classRemoved: aClassRemovalAnnouncement
  "aRemovalAnnouncement is platform-specific ... responds to #itemClass to 
   answer the class that was removed."

  | aClass registration |
  aClass := aClassRemovalAnnouncement itemClass.
  registration := self
    registrationForClassNamed: aClass name asString
    ifAbsent: [ ^ self ].
  registration unregisterProject