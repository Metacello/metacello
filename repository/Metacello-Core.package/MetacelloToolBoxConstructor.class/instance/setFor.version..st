api callbacks
setFor: attributeList version: aString
    "conditional symbolicVersion support"

    attributeList
        do: [ :attribute | 
            self methodSections
                add:
                    (MetacelloSymbolicVersionSpec new
                        attribute: attribute;
                        versionString: aString;
                        yourself) ]