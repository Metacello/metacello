private
sourceCodeAt: selector
  | theImplementingClass |
  theImplementingClass := self class whichClassIncludesSelector: selector.
  ^ (theImplementingClass sourceCodeAt: selector) asString