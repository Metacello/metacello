accessing
loadType
  "override in subclass to change to #atomic if desired.
   #atomic loads all packages in a single step instead of one package at a time in #linear"

  ^ #'linear'