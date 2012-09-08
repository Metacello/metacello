adding
addMethodSection: attribute versionString: aString
    self methodSections
        add:
            (MetacelloSymbolicVersionSpec new
                attributes: attribute asMetacelloAttributePath;
                versionString: aString;
                yourself)