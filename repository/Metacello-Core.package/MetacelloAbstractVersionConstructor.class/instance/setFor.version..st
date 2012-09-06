api callbacks
setFor: attributeList version: aString
    "conditional symbolicVersion support"

    attributeList
        do: [ :attribute | 
            self attributeMap at: attribute put: aString.
            self addAttribute: attribute ]